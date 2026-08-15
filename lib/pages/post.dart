import "dart:io";

import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/const.dart";
import "package:karotator/enum.dart";
import "package:karotator/objects/circle.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/objects/state.dart";
import "package:karotator/pages/post_detail.dart";
import "package:karotator/ui/create_post/content_disclosure.dart";
import "package:karotator/ui/create_post/highlight_text_editing_controller.dart";
import "package:karotator/ui/create_post/media_thumbnail.dart";
import "package:karotator/ui/create_post/poll_settings.dart";
import "package:karotator/ui/create_post/setting_choice.dart";
import "package:karotator/ui/create_post/toolbar.dart";
import "package:karotator/ui/datetime.dart";
import "package:karotator/ui/post/avatar.dart";
import "package:karotator/ui/post/content.dart";
import "package:karotator/ui/post/header.dart";
import "package:karotator/utils.dart";
import "package:material_symbols_icons/symbols.dart";

/// 本文の上限。超えると投稿ボタンが無効になる。
const _maxLength = 200;

class PostPage extends StatefulWidget {
  const PostPage({super.key, this.post, this.type, this.content = ""});

  /// 返信元 / 引用元。新規投稿なら null。
  final Post? post;
  final InternalPostType? type;
  final String content;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String? _avatarUrl;
  List<Circle> _circles = [];

  final List<MediaState> _medias = [];
  PostVisibility _visibility = PostVisibility.PUBLIC;
  ReplyRestriction _replyRestriction = ReplyRestriction.EVERYONE;
  int? _viewerCircleId;
  int? _replyCircleId;
  DateTime? _scheduledFor;
  ContentDisclosure _disclosure = const ContentDisclosure();
  List<String>? _pollOptions;
  int? _pollDurationHours;
  bool _pollOpen = false;

  late final HighlightTextEditingController _postController =
      HighlightTextEditingController()..text = widget.content;
  final ValueNotifier<bool> _canPost = ValueNotifier(false);

  bool get _isReply => widget.post != null && widget.type == InternalPostType.reply;
  bool get _isQuote =>
      widget.post != null && widget.type == InternalPostType.rekarot;

  @override
  void initState() {
    super.initState();
    _postController.addListener(_onTextChanged);

    KarotterApi().session.login().then((response) {
      if (!mounted) return;
      setState(() => _avatarUrl = response?.user.avatarUrl);
    });
    KarotterApi().social.circles().then((circles) {
      if (!mounted) return;
      setState(() => _circles = circles);
    });
  }

  @override
  void dispose() {
    _postController.removeListener(_onTextChanged);
    _postController.dispose();
    _canPost.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final length = _postController.text.length;
    _canPost.value = length > 0 && length <= _maxLength;
    // ここで setState を呼ばないこと。1 文字ごとに画面全体が作り直される。
    // 本文に依存する表示は _postController を listenable にして局所的に更新する。
  }

  // ---- 投稿 ----

  /// 投稿する。
  ///
  /// 先に画面を閉じてしまうので、この先で `context` と `mounted` は使えない
  /// （`mounted` は必ず false になり、結果の表示が丸ごと飛ぶ）。
  /// 進捗と結果はグローバルな [messengerKey] / [navigatorKey] 経由で出す。
  Future<void> _createPost() async {
    final content = _postController.text;

    Navigator.pop(context);

    messengerKey.currentState?.showSnackBar(
      const SnackBar(
        content: Text("投稿しています..."),
        duration: Duration(minutes: 1),
      ),
    );

    try {
      final post = await KarotterApi().posts.create(
        content,
        visibility: _visibility,
        replyRestriction: _replyRestriction,
        viewerCircleId: _viewerCircleId,
        replyCircleId: _replyCircleId,
        medias: [for (final media in _medias) media.file],
        mediaAlts: [for (final media in _medias) media.alt],
        mediaSpoilerFlags: [for (final media in _medias) media.spoiler],
        mediaR18Flags: [for (final media in _medias) media.nsfw],
        scheduledFor: _scheduledFor,
        isAiGenerated: _disclosure.isAiGenerated,
        isPromotional: _disclosure.isPromotional,
        hideFromMinors: _disclosure.hideFromMinors,
        isR18: _disclosure.isR18,
        pollOptions: _pollOptions,
        pollDurationHours: _pollDurationHours,
        parentId: _isReply ? widget.post!.id : null,
        quotedPostId: _isQuote ? widget.post!.id : null,
      );

      _showResult(_postedSnackBar(post));
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      _showResult(SnackBar(content: Text("投稿に失敗しました: $e")));
    }
  }

  void _showResult(SnackBar snackBar) {
    messengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  SnackBar _postedSnackBar(Post post) {
    final context = navigatorKey.currentContext;

    return SnackBar(
      content: GestureDetector(
        onTap: () => navigatorKey.currentState?.push(
          MaterialPageRoute(builder: (_) => PostDetailPage(post: post)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Icon(
              Icons.check_circle,
              color: context == null ? null : Theme.of(context).primaryColor,
            ),
            const Text("投稿しました。タップで開く"),
          ],
        ),
      ),
    );
  }

  // ---- 設定 ----

  /// 選択肢を並べたシートを開き、選ばれたものを反映する。
  Future<void> _openChoiceSheet<T>(
    List<PostSettingChoice<T>> choices, {
    required bool Function(PostSettingChoice<T> choice) isSelected,
    required void Function(PostSettingChoice<T> choice) onSelected,
  }) async {
    final choice = await showModalBottomSheet<PostSettingChoice<T>>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final choice in choices)
              ListTile(
                leading: Icon(choice.icon),
                title: Text(choice.label),
                trailing: isSelected(choice) ? const Icon(Icons.check) : null,
                onTap: () => Navigator.pop(context, choice),
              ),
          ],
        ),
      ),
    );

    if (choice == null || !mounted) return;
    setState(() => onSelected(choice));
  }

  void _openVisibilitySetting() {
    _openChoiceSheet<PostVisibility>(
      [
        const PostSettingChoice(
          label: "全体",
          icon: Symbols.globe,
          value: PostVisibility.PUBLIC,
        ),
        for (final circle in _circles)
          PostSettingChoice(
            label: "サークル限定: ${circle.name}",
            icon: Symbols.group,
            value: PostVisibility.CIRCLE,
            circle: circle,
          ),
      ],
      isSelected: (choice) =>
          choice.value == _visibility &&
          (choice.circle == null || choice.circle!.id == _viewerCircleId),
      onSelected: (choice) {
        _visibility = choice.value;
        _viewerCircleId = choice.circle?.id;
      },
    );
  }

  void _openReplyRestrictionSetting() {
    _openChoiceSheet<ReplyRestriction>(
      [
        const PostSettingChoice(
          label: "全員",
          icon: Symbols.globe,
          value: ReplyRestriction.EVERYONE,
        ),
        const PostSettingChoice(
          label: "フォロー中",
          icon: Icons.person_add,
          value: ReplyRestriction.FOLLOWING,
        ),
        const PostSettingChoice(
          label: "メンションのみ",
          icon: Icons.alternate_email,
          value: ReplyRestriction.MENTIONED,
        ),
        for (final circle in _circles)
          PostSettingChoice(
            label: "サークル限定: ${circle.name}",
            icon: Symbols.group,
            value: ReplyRestriction.CIRCLE,
            circle: circle,
          ),
      ],
      isSelected: (choice) =>
          choice.value == _replyRestriction &&
          (choice.circle == null || choice.circle!.id == _replyCircleId),
      onSelected: (choice) {
        _replyRestriction = choice.value;
        _replyCircleId = choice.circle?.id;
      },
    );
  }

  Future<void> _openContentDisclosure() async {
    final result = await showContentDisclosureDialog(context, _disclosure);
    if (result == null || !mounted) return;
    setState(() => _disclosure = result);
  }

  void _openSchedule() {
    showModalBottomSheet(
      context: context,
      builder: (context) => DateTimeSelector(
        dateTime: _scheduledFor,
        onConfirm: (dt) => setState(() => _scheduledFor = dt),
        onDelete: () => setState(() => _scheduledFor = null),
      ),
    );
  }

  void _togglePoll() {
    setState(() {
      _pollOpen = !_pollOpen;
      _pollOptions = _pollOpen ? [] : null;
      _pollDurationHours = _pollOpen ? 1 : null;
    });
  }

  // ---- 添付 ----

  Future<void> _pickImages() async {
    final results = await ImagePicker().pickMultiImage();

    for (final result in results) {
      final file = File(result.path);
      final state = MediaState(
        file: file,
        thumbnail: await file.readAsBytes(),
        type: MediaType.image,
      );
      if (!mounted) return;
      setState(() => _medias.add(state));
    }
  }

  Future<void> _pickVideo() async {
    final result = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (result == null) return;

    final file = File(result.path);
    final thumbnail = await getVideoThumbnail(file.path);
    if (thumbnail == null || !mounted) return;

    setState(
      () => _medias.add(
        MediaState(file: file, thumbnail: thumbnail, type: MediaType.video),
      ),
    );
  }

  // ---- 描画 ----

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        actions: [
          TextButton(onPressed: () {}, child: const Text("下書き")),
          ValueListenableBuilder<bool>(
            valueListenable: _canPost,
            builder: (context, canPost, _) => ElevatedButton(
              onPressed: canPost ? _createPost : null,
              child: const Text('カロート'),
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              if (_isReply) _ReferencedPost(post: widget.post!),
              _buildComposer(),
              if (_isQuote) _ReferencedPost(post: widget.post!, boxed: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ComposerToolbar(
        controller: _postController,
        maxLength: _maxLength,
        onVisibility: _openVisibilitySetting,
        onReplyRestriction: _openReplyRestrictionSetting,
        onPickImages: _pickImages,
        onPickVideo: _pickVideo,
        onTogglePoll: _togglePoll,
        onSchedule: _openSchedule,
        onContentDisclosure: _openContentDisclosure,
        scheduled: _scheduledFor != null,
        pollOpen: _pollOpen,
        disclosed: _disclosure.hasAny,
      ),
    );
  }

  Widget _buildComposer() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        PostUserAvatar(avatarUrl: _avatarUrl),
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
              if (_pollOpen)
                PollSettings(
                  onChanged: (options) => _pollOptions = options,
                  onDurationChanged: (duration) =>
                      _pollDurationHours = duration,
                ),
              ComposerMediaStrip(
                medias: _medias,
                onRemove: (media) => setState(() => _medias.remove(media)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 返信元 / 引用元のカロート。引用のときだけ枠で囲む。
class _ReferencedPost extends StatelessWidget {
  const _ReferencedPost({required this.post, this.boxed = false});

  final Post post;
  final bool boxed;

  @override
  Widget build(BuildContext context) {
    final tile = ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: PostUserAvatar(avatarUrl: post.author.avatarUrl),
      title: PostUserDetail(author: post.author, createdAt: post.createdAt),
      subtitle: PostContent(post: post, hideActions: true, hideReplyTo: true),
    );

    if (!boxed) return tile;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: tile,
    );
  }
}
