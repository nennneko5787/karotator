import "package:flutter/material.dart";

class ImageViewer extends StatefulWidget {
  final List<String> urls;
  final int initialIndex;

  const ImageViewer({
    super.key,
    required this.urls,
    required this.initialIndex,
  });

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: widget.urls.length,
            itemBuilder: (context, index) {
              return InteractiveViewer(
                child: Center(child: Image.network(widget.urls[index])),
              );
            },
          ),

          /// 閉じるボタン
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: Colors.white, size: 28),
            ),
          ),
        ],
      ),
    );
  }
}
