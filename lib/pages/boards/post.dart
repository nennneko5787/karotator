import "dart:io";

import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:karotator/enum.dart";
import "package:karotator/factory/post.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/state.dart";

class PostThread extends StatefulWidget {
  const PostThread({super.key});

  @override
  State<PostThread> createState() => _PostThreadState();
}

class _PostThreadState extends State<PostThread> {
  String? _avatarUrl;
  List<MediaState> medias = [];
  late final TextEditingController _postController = TextEditingController();
  late final TextEditingController _threadTitleController =
      TextEditingController();
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
    _threadTitleController.dispose();
    _postController.dispose();
    _isPostButtonEnabled.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final contentLength = _postController.text.length;
    final titleLength = _threadTitleController.text.length;
    _isPostButtonEnabled.value = contentLength > 0 && titleLength > 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.close),
        ),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: _isPostButtonEnabled,
            builder: (context, isEnabled, child) {
              return ElevatedButton(
                onPressed: isEnabled
                    ? () async {
                        // await _createThread();
                      }
                    : null,
                child: const Text('スレッド作成'),
              );
            },
          ),
          SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              postUserAvatarFactory(_avatarUrl),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    TextField(
                      controller: _threadTitleController,
                      decoration: const InputDecoration(
                        labelText: '新規スレッドタイトル',
                      ),
                      autofillHints: const [AutofillHints.username],
                    ),
                    TextField(
                      controller: _postController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: '本文',
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
                                        icon: const Icon(Icons.close, size: 16),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: BottomAppBar(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () async {
                  final picker = ImagePicker();
                  final results = await picker.pickMultiImage();

                  for (var result in results) {
                    File file = File(result.path);
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
                tooltip: "画像を添付",
                icon: const Icon(Icons.image_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
