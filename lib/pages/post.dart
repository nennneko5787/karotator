import "dart:io";

import "package:flutter/material.dart";
import "package:karotator/enum.dart";
import "package:karotator/factory/post.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/objects/state.dart";
import "package:karotator/ui/highlight_text_editing_controller.dart";
import "package:karotator/ui/media_settings.dart";
import "package:karotator/utils.dart";
import "package:material_symbols_icons/symbols.dart";
import 'package:karotator/const.dart';
import 'package:file_picker/file_picker.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, this.post, this.type});

  final Post? post;
  final InternalPostType? type;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _pageKey = GlobalKey<ScaffoldState>();
  String? _avatarUrl;
  List<MediaState> medias = [];
  final HighlightTextEditingController _postController =
      HighlightTextEditingController();
  final ValueNotifier<bool> _isPostButtonEnabled = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _postController.addListener(_onTextChanged);
    HTTPClient().loadLoginResponse().then(
      (response) => {
        setState(() {
          _avatarUrl = response?.user.avatarUrl;
        }),
      },
    );
  }

  @override
  void dispose() {
    _postController.removeListener(_onTextChanged);
    _postController.dispose();
    _isPostButtonEnabled.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final length = _postController.text.length;
    _isPostButtonEnabled.value = length > 0 && length <= 200;
    setState(() {});
  }

  Future<void> _createPost() async {
    final content = _postController.text;

    messengerKey.currentState?.showSnackBar(
      SnackBar(content: Text("投稿しています...")),
    );

    try {
      final post = await HTTPClient().createPost(
        content,
        medias: [for (var media in medias) media.file],
        mediaAlts: [for (var media in medias) media.alt],
        mediaSpoilerFlags: [for (var media in medias) media.spoiler],
        mediaR18Flags: [for (var media in medias) media.nsfw],
        parentId: (widget.post != null && widget.type == InternalPostType.reply)
            ? widget.post?.id
            : null,
        quotedPostId:
            (widget.post != null && widget.type == InternalPostType.rekarot)
            ? widget.post?.id
            : null,
      );
      messengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("投稿しました。 ID:${post.id}")),
      );
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      messengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _pageKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.close),
        ),
        actions: [
          TextButton(
            onPressed: () => {Navigator.pop(context)},
            child: const Text("下書き"),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _isPostButtonEnabled,
            builder: (context, isEnabled, child) {
              return ElevatedButton(
                onPressed: isEnabled
                    ? () async {
                        Navigator.pop(context);
                        await _createPost();
                      }
                    : null,
                child: const Text('カロート'),
              );
            },
          ),
          SizedBox(width: 4),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            if (widget.post != null && widget.type == InternalPostType.reply)
              ListTile(
                titleAlignment: ListTileTitleAlignment.top,
                leading: postUserAvatarFactory(widget.post!.author.avatarUrl),
                title: postUserDetailFactory(widget.post!, context),
                subtitle: postContentFactory(
                  widget.post!,
                  context,
                  hideActions: true,
                ),
              ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          _avatarUrl != null
                              ? "https://karotter.com$_avatarUrl"
                              : "https://karotter.com/default-avatar.png",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        TextField(
                          controller: _postController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: '思いついたことを書き込んでみましょう…',
                            border: InputBorder.none,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var media in medias)
                                SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      (media.type == MediaType.video)
                                          ? Image.memory(
                                              media.thumbnail!,
                                              width: 200,
                                              height: 200,
                                            )
                                          : Image.file(
                                              media.file,
                                              width: 200,
                                              height: 200,
                                            ),
                                      if (media.type == MediaType.video)
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black,
                                            ),
                                            child: IconButton(
                                              onPressed: null,
                                              icon: const Icon(
                                                Icons.play_arrow,
                                                size: 16,
                                              ),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                medias.remove(media);
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              size: 16,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              showMediaSettings(context, media);
                                            },
                                            icon: const Icon(
                                              Symbols.stylus,
                                              size: 16,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                          child: IconButton(
                                            onPressed: null,
                                            icon: Icon(
                                              (media.type == MediaType.image)
                                                  ? Icons.image
                                                  : Icons.movie,
                                              size: 16,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.post != null &&
                      widget.type == InternalPostType.rekarot)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        titleAlignment: ListTileTitleAlignment.top,
                        leading: postUserAvatarFactory(
                          widget.post!.author.avatarUrl,
                        ),
                        title: postUserDetailFactory(widget.post!, context),
                        subtitle: postContentFactory(
                          widget.post!,
                          context,
                          hideActions: true,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            TextButton(onPressed: () {}, child: Text("公開: 全体")),
            TextButton(onPressed: () {}, child: Text("返信: 全体")),
            IconButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  allowedExtensions: [
                    "tiff",
                    "pjp",
                    "apng",
                    "xbm",
                    "xjk",
                    "jpe",
                    "svgz",
                    "jpg",
                    "jpeg",
                    "heif",
                    "ico",
                    "tif",
                    "webp",
                    "jfif",
                    "heic",
                    "gif",
                    "svg",
                    "bmp",
                    "pjpeg",
                    "avif",
                  ],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                  final state = MediaState(
                    file: file,
                    thumbnail: await file.readAsBytes(),
                    type: MediaType.image,
                  );
                  setState(() {
                    medias.add(state);
                  });
                }
              },
              icon: const Icon(Icons.image_outlined),
            ),
            IconButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  allowedExtensions: [
                    "mpe",
                    "mpeg",
                    "ogm",
                    "mkv",
                    "mpg",
                    "wmv",
                    "webm",
                    "ogv",
                    "mov",
                    "m4v",
                    "asx",
                    "mp4",
                    "avi",
                  ],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                  final thumbnail = await getVideoThumbnail(file.path);
                  if (thumbnail != null) {
                    final state = MediaState(
                      file: file,
                      thumbnail: thumbnail,
                      type: MediaType.video,
                    );
                    setState(() {
                      medias.add(state);
                    });
                  }
                }
              },
              icon: const Icon(Icons.movie),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.how_to_vote)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Symbols.calendar_clock),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.verified)),
            const Spacer(),
            Text(
              '${medias.length} | ${_postController.text.length} / 200',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: _postController.text.length > 200 ? Colors.red : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
