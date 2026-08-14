import "package:flutter/material.dart";
import "package:karotator/enum.dart";
import "package:karotator/objects/state.dart";
import "package:karotator/ui/create_post/media_settings.dart";
import "package:material_symbols_icons/symbols.dart";

const _size = 200.0;

/// 投稿画面で添付済みメディアを並べる帯。
class ComposerMediaStrip extends StatelessWidget {
  const ComposerMediaStrip({
    super.key,
    required this.medias,
    required this.onRemove,
  });

  final List<MediaState> medias;
  final void Function(MediaState media) onRemove;

  @override
  Widget build(BuildContext context) {
    if (medias.isEmpty) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final media in medias)
            ComposerMediaThumbnail(
              media: media,
              onRemove: () => onRemove(media),
            ),
        ],
      ),
    );
  }
}

/// 添付 1 件。四隅にそれぞれ別の役割のボタンが乗る。
class ComposerMediaThumbnail extends StatelessWidget {
  const ComposerMediaThumbnail({
    super.key,
    required this.media,
    required this.onRemove,
  });

  final MediaState media;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final isVideo = media.type == MediaType.video;

    return SizedBox(
      width: _size,
      height: _size,
      child: Stack(
        children: [
          isVideo
              ? Image.memory(media.thumbnail!, width: _size, height: _size)
              : Image.file(media.file, width: _size, height: _size),
          // 動画であることの印。押せない。
          if (isVideo)
            const _CornerButton(
              alignment: Alignment.center,
              icon: Icons.play_arrow,
            ),
          _CornerButton(
            alignment: Alignment.topRight,
            icon: Icons.close,
            onPressed: onRemove,
          ),
          _CornerButton(
            alignment: Alignment.bottomLeft,
            icon: Symbols.stylus,
            background: Theme.of(context).primaryColor,
            onPressed: () => showMediaSettings(context, media),
          ),
          _CornerButton(
            alignment: Alignment.bottomRight,
            icon: isVideo ? Icons.movie : Icons.image,
          ),
        ],
      ),
    );
  }
}

class _CornerButton extends StatelessWidget {
  const _CornerButton({
    required this.alignment,
    required this.icon,
    this.onPressed,
    this.background,
  });

  final Alignment alignment;
  final IconData icon;

  /// null なら飾りとして置くだけで押せない。
  final VoidCallback? onPressed;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: background ?? Colors.black,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 16),
          color: Colors.white,
        ),
      ),
    );
  }
}
