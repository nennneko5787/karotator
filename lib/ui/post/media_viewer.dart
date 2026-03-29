import "package:flutter/material.dart";
import "package:video_player/video_player.dart";
import 'package:flutter/services.dart';
import 'package:chewie/chewie.dart';

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
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.url));
    try {
      await _videoController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        autoPlay: true,
        looping: true,
      );
      setState(() {});
    } on MissingPluginException {
      setState(() => _hasError = true);
    } on UnimplementedError {
      setState(() => _hasError = true);
    }
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Center(child: Image.asset('assets/images/dummy_image.png'));
    }
    if (_chewieController == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Center(
      child: AspectRatio(
        aspectRatio: _videoController.value.aspectRatio,
        child: Chewie(controller: _chewieController!),
      ),
    );
  }
}
