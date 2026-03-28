import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/response.dart";
import "package:karotator/objects/user.dart";
import "package:karotator/pages/login.dart";
import "package:karotator/pages/post.dart";
import "package:karotator/providers/user.dart";
import "package:karotator/ui/profile_tab.dart";
import "package:karotator/utils.dart";
import "package:material_symbols_icons/symbols.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.username});

  final String username;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  UserResponse? response;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    final response = await HTTPClient().getUserByUsername(widget.username);
    setState(() {
      this.response = response;
      user = response.user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: (user == null)
              ? const Text("ユーザー")
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user!.displayName),
                    Text(
                      "${user!.postsCount} カロート",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
        ),
        body: (user == null && response == null)
            ? const Center(child: CircularProgressIndicator())
            : _ProfileBody(user: user!, response: response!),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (HTTPClient().nowAccountId == null)
                    ? LoginPage()
                    : PostPage(
                        content: (user?.id != HTTPClient().nowUserId)
                            ? "@${user!.username} "
                            : "",
                      ),
              ),
            ),
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _ProfileBody extends ConsumerStatefulWidget {
  final User user;
  final UserResponse response;

  const _ProfileBody({required this.user, required this.response});

  @override
  ConsumerState<_ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends ConsumerState<_ProfileBody> {
  late User user = widget.user;
  late UserResponse response = widget.response;

  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      ref
          .read(userResponseProvider(user.id).notifier)
          .initialize(widget.response);
    });
  }

  Future<Object> _fetcher(int page, int limit) {
    return switch (selectedTab) {
      0 => HTTPClient().getPostsByUserId(
        userId: widget.user.id,
        page: page,
        limit: limit,
      ),
      1 => HTTPClient().getUserRepliesByUserId(
        userId: widget.user.id,
        page: page,
        limit: limit,
      ),
      2 => HTTPClient().getUserMediasByUserId(
        userId: widget.user.id,
        page: page,
        limit: limit,
      ),
      _ => HTTPClient().getUserLikesByUserId(
        userId: widget.user.id,
        page: page,
        limit: limit,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final currentUserResponse = ref.watch(userResponseProvider(user.id));
    final notifier = ref.read(userResponseProvider(user.id).notifier);

    return ProfileTab(
      fetcher: _fetcher,
      pinnedPost: selectedTab == 0 ? currentUserResponse.pinnedPost : null,
      header: _buildHeader(currentUserResponse, notifier),
      selectedTab: selectedTab,
      onTabChanged: (index) => setState(() => selectedTab = index),
    );
  }

  Widget _buildHeader(UserResponse response, UserResponseNotifier notifier) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: (user.headerUrl != null)
                  ? Image.network(
                      "https://karotter.com${user.headerUrl}",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.33,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.33,
                      color: const Color(0xFFDCE8F0),
                    ),
            ),
            Positioned(
              bottom: -40,
              left: 16,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 4,
                  ),
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: (user.avatarUrl != null)
                      ? NetworkImage("https://karotter.com${user.avatarUrl}")
                      : null,
                  child: (user.avatarUrl == null)
                      ? Image.asset("assets/images/default-avatar.png")
                      : null,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      user.displayName,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.apply(fontWeightDelta: 50),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "@${user.username}",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (response.isFollowedBy) const Text("フォローされています"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            (HTTPClient().nowUserId == user.id)
                ? OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("プロフィールを編集"),
                  )
                : (response.isFollowing)
                ? OutlinedButton(
                    onPressed: () async {
                      await notifier.toggleFollow();
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("フォロー中"),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      await notifier.toggleFollow();
                    },
                    child: const Text("フォロー"),
                  ),
            SizedBox(width: 12),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (user.bio != null) Text(user.bio!),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    if (user.location != null)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          Text(
                            " ${user.location!}",
                            style: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        ],
                      ),
                    if (user.websiteUrl != null)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.link,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          RichText(
                            text: TextSpan(
                              text: " ${user.websiteUrl!}",
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  await openURL(user.websiteUrl!);
                                },
                            ),
                          ),
                        ],
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Symbols.calendar_month,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        Text(
                          " ${user.createdAt.year}年${user.createdAt.month}月に参加",
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.followingCount.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " フォロー中",
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.followersCount.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " フォロワー",
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
