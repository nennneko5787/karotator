/// 添付の種類。
///
/// Karotter は画像・動画に加えて**音声**も添付できる。
/// `mediaTypes` は `image` / `video` / `audio` のこともあれば
/// `image/png` のような MIME 型のこともあり、欠けていることもある。
/// 欠けている場合は拡張子で判断する（Karotter Web と同じ）。
///
/// 出典: `profile._username` チャンク。
///
/// ```js
/// // 画像か動画
/// "image"===t || "video"===t || t?.startsWith("image/") || t?.startsWith("video/")
/// // 音声
/// t ? ("audio"===t || t.startsWith("audio/")) : /\.(mp3|wav|m4a|ogg|aac)(\?|$)/i.test(url)
/// // 動画
/// t ? ("video"===t || t.startsWith("video/")) : /\.(mp4|webm|mov|m4v|avi)$/i.test(url)
/// ```
library;

enum MediaKind { image, video, audio }

final _videoExtension = RegExp(
  r'\.(mp4|webm|mov|m4v|avi)(\?|$)',
  caseSensitive: false,
);

final _audioExtension = RegExp(
  r'\.(mp3|wav|m4a|ogg|aac|flac)(\?|$)',
  caseSensitive: false,
);

/// 添付 1 つの種類を決める。
///
/// [type] は `mediaTypes` の対応する要素。無ければ null を渡す。
/// どれとも判断できなければ画像として扱う（今までの挙動）。
MediaKind mediaKindOf(String url, String? type) {
  if (type != null && type.isNotEmpty) {
    if (type == 'video' || type.startsWith('video/')) return MediaKind.video;
    if (type == 'audio' || type.startsWith('audio/')) return MediaKind.audio;
    if (type == 'image' || type.startsWith('image/')) return MediaKind.image;
  }

  // 型が無い、または知らない型。拡張子で見る。
  if (_videoExtension.hasMatch(url)) return MediaKind.video;
  if (_audioExtension.hasMatch(url)) return MediaKind.audio;
  return MediaKind.image;
}

/// 添付 1 つ。URL と種類の組。
class MediaAttachment {
  const MediaAttachment({required this.url, required this.kind});

  final String url;
  final MediaKind kind;

  bool get isAudio => kind == MediaKind.audio;
  bool get isVideo => kind == MediaKind.video;
}

/// `mediaUrls` と `mediaTypes` を組にする。
///
/// 長さが揃っていないことがあるので、足りない側は null 扱いにする。
List<MediaAttachment> attachmentsOf(
  List<String> urls,
  List<String> types,
) => [
  for (final (index, url) in urls.indexed)
    MediaAttachment(
      url: url,
      kind: mediaKindOf(url, index < types.length ? types[index] : null),
    ),
];

/// 画像か動画の添付があるか。
///
/// プロフィールのメディア欄で使う。`GET /users/{id}/media` はメディアを
/// 持たないカロートも返すことがあり、Karotter Web もクライアント側で
/// 同じ絞り込みをしている（音声だけの添付は数えない）。
bool hasVisualMedia(List<String> urls, List<String> types) =>
    attachmentsOf(urls, types).any((a) => !a.isAudio);
