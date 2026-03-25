import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/ui/highlight_text_editing_controller.dart";
import "package:material_symbols_icons/symbols.dart";

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final pageKey = GlobalKey<ScaffoldState>();
  String? avatarUrl;
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
          avatarUrl = response?.user.avatarUrl;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: pageKey,
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
                onPressed: isEnabled ? () async => {} : null,
                child: const Text('カロート'),
              );
            },
          ),
          SizedBox(width: 4),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(8),
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
                    avatarUrl != null
                        ? "https://karotter.com$avatarUrl"
                        : "https://karotter.com/default-avatar.png",
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: _postController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: '思いついたことを書き込んでみましょう…',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          top: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0
              ? 8
              : 8 + MediaQuery.of(context).padding.bottom,
        ),
        child: Row(
          children: [
            TextButton(onPressed: () {}, child: Text("公開: 全体")),
            TextButton(onPressed: () {}, child: Text("返信: 全体")),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.image_outlined),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.movie)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.how_to_vote)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Symbols.calendar_clock),
            ),
            const Spacer(),
            Text(
              '${_postController.text.length} / 200',
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
