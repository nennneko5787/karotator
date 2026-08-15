import "dart:async";
import "dart:io";

import "package:audioplayers/audioplayers.dart";
import "package:flutter/material.dart";
import "package:karotator/utils.dart";

/// 添付された音声 1 つ。再生・停止と再生位置を出す。
///
/// **URL を直接プレイヤーに渡さない。** Windows の audioplayers は OS の
/// メディア基盤（Media Foundation）越しに取りに行くので、端末の TLS 設定が
/// Karotter のサーバーと折り合わないと `0x80072F8F` で落ちる。Dart の
/// `HttpClient` は独自の TLS を持っていて同じ環境でも通るため、こちらで
/// 取ってから一時ファイルとして渡す。
///
/// カロートに複数の音声が付くことがあるので、プレイヤーはこの widget が
/// 自分で持つ。画面を離れたら止めて一時ファイルも消す。
class PostAudio extends StatefulWidget {
  const PostAudio({super.key, required this.url});

  /// 絶対 URL。
  final String url;

  @override
  State<PostAudio> createState() => _PostAudioState();
}

class _PostAudioState extends State<PostAudio> {
  final AudioPlayer _player = AudioPlayer();
  final List<StreamSubscription<void>> _subscriptions = [];

  Duration _position = Duration.zero;
  Duration? _duration;
  bool _playing = false;
  bool _preparing = false;
  String? _error;

  /// 取得済みの一時ファイル。2 回目以降は取り直さない。
  File? _cached;

  @override
  void initState() {
    super.initState();

    // どのストリームにも onError を付ける。付けないと、プラットフォームから
    // 流れてくる失敗が未処理例外になりアプリが止まる。
    void watch<T>(Stream<T> stream, void Function(T value) onData) {
      _subscriptions.add(
        stream.listen(
          onData,
          onError: (Object e, StackTrace s) {
            debugPrint("$e\n$s");
            if (mounted) setState(() => _error = "この音声は再生できません");
          },
        ),
      );
    }

    watch(_player.onPositionChanged, (position) {
      if (mounted) setState(() => _position = position);
    });
    watch(_player.onDurationChanged, (duration) {
      if (mounted) setState(() => _duration = duration);
    });
    watch(_player.onPlayerStateChanged, (state) {
      if (mounted) setState(() => _playing = state == PlayerState.playing);
    });
    watch(_player.onPlayerComplete, (_) {
      if (mounted) setState(() => _position = Duration.zero);
    });
  }

  @override
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _player.dispose();
    // 一時ファイルを残さない。失敗しても気にしない。
    _cached?.delete().catchError((_) => _cached!);
    super.dispose();
  }

  /// 音声を取ってきて一時ファイルに置く。
  Future<File> _download() async {
    final cached = _cached;
    if (cached != null && await cached.exists()) return cached;

    final client = HttpClient();
    try {
      final request = await client.getUrl(Uri.parse(widget.url));
      final response = await request.close();
      if (response.statusCode != HttpStatus.ok) {
        throw HttpException(
          '${response.statusCode}',
          uri: Uri.parse(widget.url),
        );
      }

      // 拡張子を残す。プレイヤーが形式の判断に使うことがある。
      final name = Uri.parse(widget.url).pathSegments.last;
      final file = File(
        '${Directory.systemTemp.path}/karotator_audio_${widget.url.hashCode}_$name',
      );
      await response.pipe(file.openWrite());
      _cached = file;
      return file;
    } finally {
      client.close(force: true);
    }
  }

  Future<void> _toggle() async {
    if (_preparing) return;

    if (_playing) {
      await _player.pause();
      return;
    }

    setState(() {
      _preparing = true;
      _error = null;
    });

    try {
      final file = await _download();
      await _player.play(DeviceFileSource(file.path));
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if (mounted) setState(() => _error = "この音声は再生できません");
    } finally {
      if (mounted) setState(() => _preparing = false);
    }
  }

  Future<void> _seek(double seconds) async {
    final target = Duration(seconds: seconds.round());
    setState(() => _position = target);
    await _player.seek(target);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final subColor = theme.secondaryHeaderColor;
    final total = _duration;
    final failed = _error != null;
    final hasSlider = total != null && total != Duration.zero && !failed;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          if (_preparing)
            const Padding(
              padding: EdgeInsets.all(12),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            IconButton(
              icon: Icon(
                failed
                    ? Icons.refresh
                    : _playing
                    ? Icons.pause_circle
                    : Icons.play_circle,
                size: 28,
              ),
              // 失敗しても押せば取り直せる。一時的な通信の失敗もあるため。
              tooltip: failed
                  ? "もう一度試す"
                  : _playing
                  ? "一時停止"
                  : "再生",
              onPressed: _toggle,
            ),
          Expanded(
            child: hasSlider
                ? Slider(
                    value: _position.inSeconds
                        .clamp(0, total.inSeconds)
                        .toDouble(),
                    max: total.inSeconds.toDouble(),
                    onChanged: _seek,
                  )
                // 長さが分かるまではつまみを出さない。
                : Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _error ?? (_preparing ? "読み込み中..." : "音声"),
                      style: TextStyle(
                        fontSize: 12,
                        color: failed ? theme.colorScheme.error : subColor,
                      ),
                    ),
                  ),
          ),
          if (hasSlider)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                "${formatDuration(_position)} / ${formatDuration(total)}",
                style: TextStyle(fontSize: 11, color: subColor),
              ),
            ),
        ],
      ),
    );
  }
}
