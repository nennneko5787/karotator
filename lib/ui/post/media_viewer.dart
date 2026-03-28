import "package:flutter/material.dart";
import "package:video_player/video_player.dart";
import 'package:flutter/services.dart';

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
  late VideoPlayerController _controller;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize()
          .then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          })
          .catchError(
            (e) {
              if (e is MissingPluginException || e is UnimplementedError) {
                setState(() {
                  _hasError = true;
                });
              }
            },
            test: (e) =>
                (e is MissingPluginException || e is UnimplementedError),
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
        // Use [Video] widget to display video output.
        child: _hasError
            ? Image.asset('assets/images/dummy_image.png')
            : _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
