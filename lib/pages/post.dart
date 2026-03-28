import "dart:io";

import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:karotator/enum.dart";
import "package:karotator/factory/post.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/circle.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/objects/state.dart";
import "package:karotator/pages/post_detail.dart";
import "package:karotator/ui/create_post/highlight_text_editing_controller.dart";
import "package:karotator/ui/create_post/media_settings.dart";
import "package:karotator/ui/create_post/poll_settings.dart";
import "package:karotator/ui/datetime.dart";
import "package:karotator/utils.dart";
import "package:material_symbols_icons/symbols.dart";
import 'package:karotator/const.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, this.post, this.type, this.content = ""});

  final Post? post;
  final InternalPostType? type;
  final String content;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String? _avatarUrl;
  List<MediaState> medias = [];
  PostVisibility visibility = PostVisibility.PUBLIC;
  ReplyRestriction replyRestriction = ReplyRestriction.EVERYONE;
  int? viewerCircleId;
  int? replyCircleId;
  DateTime? scheduledFor;
  bool isAiGenerated = false;
  bool isPromotional = false;
  bool isR18 = false;
  bool hideFromMinors = false;
  List<String>? pollOptions;
  int? pollDurationHours;

  final _pageKey = GlobalKey<ScaffoldState>();
  late final HighlightTextEditingController _postController =
      HighlightTextEditingController()..text = widget.content;
  final ValueNotifier<bool> _isPostButtonEnabled = ValueNotifier(false);
  bool _openPollSetting = false;

  List<Circle> _circles = [];

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
    HTTPClient().loadLoginResponse().then((response) => {setState(() {})});
    HTTPClient().getUserCircles().then((circles) => _circles = circles);
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
        visibility: visibility,
        replyRestriction: replyRestriction,
        viewerCircleId: viewerCircleId,
        replyCircleId: replyCircleId,
        medias: [for (var media in medias) media.file],
        mediaAlts: [for (var media in medias) media.alt],
        mediaSpoilerFlags: [for (var media in medias) media.spoiler],
        mediaR18Flags: [for (var media in medias) media.nsfw],
        scheduledFor: scheduledFor,
        isAiGenerated: isAiGenerated,
        isPromotional: isPromotional,
        hideFromMinors: hideFromMinors,
        isR18: isR18,
        pollOptions: pollOptions,
        pollDurationHours: pollDurationHours,
        parentId: (widget.post != null && widget.type == InternalPostType.reply)
            ? widget.post?.id
            : null,
        quotedPostId:
            (widget.post != null && widget.type == InternalPostType.rekarot)
            ? widget.post?.id
            : null,
      );

      if (!mounted) return;

      messengerKey.currentState!.showSnackBar(
        SnackBar(
          content: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PostDetailPage(post: post)),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle, color: Theme.of(context).primaryColor),
                Text("投稿しました。"),
              ],
            ),
          ),
        ),
      );
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      messengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  void openSetting<T>(
    T variable,
    void Function(T value, Circle? circle) onChanged, {
    required List<Map<String, Object>> items,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var item in items)
                ListTile(
                  leading: Icon(item["icon"] as IconData),
                  title: Text(item["label"] as String),
                  trailing: _isSelected(variable, item)
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    Navigator.pop(context);
                    setState(
                      () => onChanged(
                        item["value"] as T,
                        item["circle"] as Circle?,
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  bool _isSelected<T>(T variable, Map<String, Object> item) {
    if (variable != item["value"]) return false;

    final circle = item["circle"] as Circle?;
    if (circle != null) {
      return (((variable is PostVisibility) && (viewerCircleId == circle.id)) ||
          ((variable is ReplyRestriction) && (replyCircleId == circle.id)));
    }
    return true;
  }

  void openVisibilitySetting() {
    openSetting<PostVisibility>(
      visibility,
      (value, circle) {
        visibility = value;
        if (visibility == PostVisibility.CIRCLE) {
          viewerCircleId = circle!.id;
        }
      },
      items: [
        {"label": "全体", "icon": Symbols.globe, "value": PostVisibility.PUBLIC},
        for (var circle in _circles)
          {
            "label": "サークル限定: ${circle.name}",
            "icon": Symbols.group,
            "value": PostVisibility.CIRCLE,
            "circle": circle,
          },
      ],
    );
  }

  void openReplyRestrictionSetting() {
    openSetting<ReplyRestriction>(
      replyRestriction,
      (value, circle) {
        replyRestriction = value;
        if (replyRestriction == ReplyRestriction.CIRCLE) {
          replyCircleId = circle!.id;
        }
      },
      items: [
        {
          "label": "全員",
          "icon": Symbols.globe,
          "value": ReplyRestriction.EVERYONE,
        },
        {
          "label": "フォロー中",
          "icon": Icons.person_add,
          "value": ReplyRestriction.FOLLOWING,
        },
        {
          "label": "メンションのみ",
          "icon": Icons.alternate_email,
          "value": ReplyRestriction.MENTIONED,
        },
        for (var circle in _circles)
          {
            "label": "サークル限定: ${circle.name}",
            "icon": Symbols.group,
            "value": ReplyRestriction.CIRCLE,
            "circle": circle,
          },
      ],
    );
  }

  Future<void> openContentDisclosureSetting() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text("コンテンツ開示の設定"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isAiGenerated,
                        onChanged: (bool? value) {
                          setDialogState(() {
                            isAiGenerated = value!;
                          });
                        },
                      ),
                      const Expanded(child: Text("このカロートはAIで作成した内容を含む")),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isPromotional,
                        onChanged: (bool? value) {
                          setDialogState(() {
                            isPromotional = value!;
                          });
                        },
                      ),
                      const Expanded(child: Text("このカロートはブランドまたはビジネスの宣伝である")),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isR18,
                        onChanged: (bool? value) {
                          setDialogState(() {
                            isR18 = value!;
                          });
                        },
                      ),
                      const Expanded(child: Text("投稿全体をR18として扱う")),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: hideFromMinors,
                        onChanged: (bool? value) {
                          setDialogState(() {
                            hideFromMinors = value!;
                          });
                        },
                      ),
                      const Expanded(child: Text("未成年ユーザーにはこの投稿を表示しない")),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
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
          TextButton(onPressed: () => {}, child: const Text("下書き")),
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
      body: SingleChildScrollView(
        child: Padding(
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
                    hideReplyTo: true,
                  ),
                ),
              Row(
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
                          controller: _postController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: '思いついたことを書き込んでみましょう…',
                            border: InputBorder.none,
                          ),
                        ),
                        if (_openPollSetting)
                          PollSettings(
                            onChanged: (options) {
                              pollOptions = options;
                            },
                            onDurationChanged: (duration) {
                              pollDurationHours = duration;
                            },
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
                ],
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
                      hideReplyTo: true,
                    ),
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
            children: [
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          openVisibilitySetting();
                        },
                        tooltip: "公開範囲",
                        icon: const Icon(Icons.visibility),
                      ),
                      IconButton(
                        onPressed: () {
                          openReplyRestrictionSetting();
                        },
                        tooltip: "返信可能なユーザーの範囲",
                        icon: const Icon(Icons.comment),
                      ),
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
                      IconButton(
                        onPressed: () async {
                          final picker = ImagePicker();
                          final result = await picker.pickVideo(
                            source: ImageSource.gallery,
                          );

                          if (result != null) {
                            File file = File(result.path);
                            final thumbnail = await getVideoThumbnail(
                              file.path,
                            );
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
                        tooltip: "動画を添付",
                        icon: const Icon(Icons.movie),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (_openPollSetting == true) {
                              pollOptions = null;
                              pollDurationHours = null;
                              _openPollSetting = false;
                            } else {
                              pollOptions = [];
                              pollDurationHours = 1;
                              _openPollSetting = true;
                            }
                          });
                        },
                        tooltip: "投票",
                        icon: const Icon(Icons.how_to_vote),
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return DateTimeSelector(
                                dateTime: scheduledFor,
                                onConfirm: (dt) {
                                  setState(() => scheduledFor = dt);
                                },
                                onDelete: () {
                                  setState(() => scheduledFor = null);
                                },
                              );
                            },
                          );
                        },
                        tooltip: "予約投稿",
                        icon: const Icon(Symbols.calendar_clock),
                        color: (scheduledFor != null) ? Colors.lightBlue : null,
                      ),
                      IconButton(
                        onPressed: () {
                          openContentDisclosureSetting();
                        },
                        tooltip: "コンテンツ開示",
                        icon: const Icon(Icons.verified),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '${_postController.text.length} / 200',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _postController.text.length > 200 ? Colors.red : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
