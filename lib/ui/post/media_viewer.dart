import "dart:io";

import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:media_kit/media_kit.dart";
import "package:media_kit_video/media_kit_video.dart";
import "package:path_provider/path_provider.dart";

class MediaViewer extends StatefulWidget {
  final List<String> urls;
  final List<bool> isVideos; // 各URLが動画かどうか
  final int initialIndex;

  const MediaViewer({
    super.key,
    required this.urls,
    required this.isVideos,
    required this.initialIndex,
  });

  @override
  State<MediaViewer> createState() => _MediaViewerState();
}

class _MediaViewerState extends State<MediaViewer> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.urls.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              if (widget.isVideos[index]) {
                return _VideoPlayerItem(url: widget.urls[index]);
              } else {
                return InteractiveViewer(
                  child: Center(child: Image.network(widget.urls[index])),
                );
              }
            },
          ),
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: Colors.white, size: 28),
            ),
          ),
          if (widget.urls.length > 1)
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6,
                children: [
                  for (int i = 0; i < widget.urls.length; i++)
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == _currentIndex
                            ? Colors.white
                            : Colors.white38,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _VideoPlayerItem extends StatefulWidget {
  const _VideoPlayerItem({required this.url});
  final String url;

  @override
  State<_VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<_VideoPlayerItem> {
  late Player player;
  late VideoController controller;
  bool isLoading = true;
  String ext = ".mp4";

  @override
  void initState() {
    super.initState();

    player = Player();
    controller = VideoController(player);
    loadAndPlayVideo();
  }

  Future<void> loadAndPlayVideo() async {
    // 1. APIからUint8Listとして取得
    final response = await HTTPClient().http.get(Uri.parse(widget.url));
    final videoBytes = response.bodyBytes; // Uint8List

    final uri = Uri.parse(widget.url);
    final pathSegments = uri.pathSegments;
    final fileName = pathSegments.isNotEmpty ? pathSegments.last : '';
    ext = fileName.contains('.') ? '.${fileName.split('.').last}' : '.mp4';

    // 2. 一時ディレクトリに保存
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/temp_video.$ext');
    await tempFile.writeAsBytes(videoBytes);

    // 3. media_kitで再生
    await player.open(Media(tempFile.path));

    setState(() => isLoading = false);
  }

  @override
  void dispose() {
    player.dispose();
    getTemporaryDirectory().then((dir) {
      final tempFile = File('${dir.path}/temp_video.$ext');
      if (tempFile.existsSync()) tempFile.deleteSync();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
        // Use [Video] widget to display video output.
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Video(controller: controller),
      ),
    );
  }
}
