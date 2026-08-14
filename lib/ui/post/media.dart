import "dart:typed_data";

import "package:flutter/material.dart";
import "package:karotator/const.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/ui/post/media_viewer.dart";
import "package:karotator/utils.dart";

/// カロートに添えられたメディア。枚数で並べ方が変わる。
class PostMedia extends StatelessWidget {
  const PostMedia({super.key, required this.post});

  final AbstractPost post;

  @override
  Widget build(BuildContext context) {
    final urls = post.mediaUrls.map(karotterUrl).toList();
    final isVideos = post.mediaTypes.map((e) => e == "video").toList();

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: _aspectRatio(urls.length),
        child: _MediaLayout(urls: urls, isVideos: isVideos),
      ),
    );
  }

  static double _aspectRatio(int count) => count <= 2 ? 16 / 9 : 1;
}

/// 1〜3 枚は専用の並べ方、4 枚以上は 2x2 のグリッド。
class _MediaLayout extends StatelessWidget {
  const _MediaLayout({required this.urls, required this.isVideos});

  final List<String> urls;
  final List<bool> isVideos;

  @override
  Widget build(BuildContext context) {
    Widget tile(int index) =>
        _MediaTile(urls: urls, isVideos: isVideos, index: index);

    switch (urls.length) {
      case 1:
        return tile(0);
      case 2:
        return Row(
          children: [
            Expanded(child: tile(0)),
            const SizedBox(width: 2),
            Expanded(child: tile(1)),
          ],
        );
      case 3:
        return Row(
          children: [
            Expanded(child: tile(0)),
            const SizedBox(width: 2),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: tile(1)),
                  const SizedBox(height: 2),
                  Expanded(child: tile(2)),
                ],
              ),
            ),
          ],
        );
      default:
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: urls.length > 4 ? 4 : urls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, index) => Stack(
            fit: StackFit.expand,
            children: [
              tile(index),
              // 4 枚目には残り枚数を重ねる。
              if (index == 3 && urls.length > 4)
                Container(
                  color: Colors.black54,
                  child: Center(
                    child: Text(
                      "+${urls.length - 4}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
    }
  }
}

class _MediaTile extends StatelessWidget {
  const _MediaTile({
    required this.urls,
    required this.isVideos,
    required this.index,
  });

  final List<String> urls;
  final List<bool> isVideos;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              MediaViewer(urls: urls, isVideos: isVideos, initialIndex: index),
        ),
      ),
      child: isVideos[index]
          ? _VideoThumbnail(url: urls[index])
          : Image.network(urls[index], fit: BoxFit.cover),
    );
  }
}

class _VideoThumbnail extends StatefulWidget {
  const _VideoThumbnail({required this.url});

  final String url;

  @override
  State<_VideoThumbnail> createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<_VideoThumbnail> {
  Uint8List? _thumbnail;

  @override
  void initState() {
    super.initState();
    _loadThumbnail();
  }

  Future<void> _loadThumbnail() async {
    final data = await getVideoThumbnail(widget.url);
    if (mounted) setState(() => _thumbnail = data);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (_thumbnail != null)
          Image.memory(_thumbnail!, fit: BoxFit.cover)
        else
          Container(color: Colors.black),
        const Center(
          child: Icon(Icons.play_circle_outline, color: Colors.white, size: 48),
        ),
      ],
    );
  }
}
