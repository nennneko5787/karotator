import "package:karotator/const.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart" hide Notification;
import "package:karotator/enum.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/objects/notification.dart";
import "package:karotator/pages/notification_posts.dart";
import "package:karotator/pages/post_detail.dart";
import "package:karotator/pages/profile.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/utils.dart";

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsState();
}

class _NotificationsState extends State<NotificationsPage> {
  late Future<void> initNotificationData;
  late ScrollController controller;

  List<Notification> notifications = [];
  int page = 1;
  bool isLoadingMore = false;
  bool hasMore = false;

  double fontSize = 12;

  @override
  void initState() {
    super.initState();

    controller = ScrollController()..addListener(onScroll);

    initNotificationData = refreshNotifications();
  }

  void onScroll() {
    if (!controller.hasClients || isLoadingMore || !hasMore) return;

    final threshold = 200.0; // 下から200pxで発火
    if (controller.position.pixels >=
        controller.position.maxScrollExtent - threshold) {
      loadMore();
    }
  }

  Future<void> refreshNotifications() async {
    try {
      isLoadingMore = true;

      final response = await KarotterApi().notifications.list(
        page: page,
        limit: 15,
      );

      await KarotterApi().notifications.markAllAsRead();

      setState(() {
        hasMore = response.pagination.hasMore;
        notifications.addAll(response.notifications as Iterable<Notification>);
      });

      isLoadingMore = false;
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");

      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  Future<void> loadMore() async {
    try {
      isLoadingMore = true;
      page++;

      final response = await KarotterApi().notifications.list(
        page: page,
        limit: 15,
      );

      setState(() {
        hasMore = response.pagination.hasMore;
        notifications.addAll(response.notifications as Iterable<Notification>);
      });

      isLoadingMore = false;
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");

      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  Widget buildNotificationTitle(Notification notification) {
    List<InlineSpan> spans = [];

    String? numOfPosts;
    if (notification.postCount > 1) {
      numOfPosts = "${notification.postCount}件の";
    }

    for (var entry in notification.actors.asMap().entries) {
      spans.add(
        TextSpan(
          text: entry.value.displayName,
          style: const TextStyle(fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProfilePage(username: entry.value.username),
                ),
              );
            },
        ),
      );

      if (notification.actors.length > 1) {
        spans.add(
          TextSpan(
            text: entry.key < notification.actors.length - 1 ? "さん、" : "さん",
          ),
        );
      }
    }

    switch (notification.type) {
      case NotificationType.LIKE:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}あなたのカロートをいいねしました"));
        break;
      case NotificationType.REPLY:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}あなたのカロートに返信しました"));
        break;
      case NotificationType.REKAROT:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}あなたのカロートをリカロートしました"));
        break;
      case NotificationType.QUOTE:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}あなたのカロートを引用しました"));
        break;
      case NotificationType.FOLLOW:
        spans.add(const TextSpan(text: "にフォローされています"));
        break;
      case NotificationType.REACTION:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}あなたのカロートにリアクションしました"));
        break;
      case NotificationType.MENTION:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}あなたをメンションしました"));
        break;
      case NotificationType.FOLLOW_REQUEST:
        spans.add(const TextSpan(text: "からフォローリクエストが届いています"));
        break;
      case NotificationType.FOLLOWED_POST:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}カロートを投稿しました"));
        break;
      case NotificationType.DM:
        spans.add(const TextSpan(text: "からメッセージが届いています"));
        break;
      case NotificationType.BOARD_NEW_THREAD:
        spans.add(const TextSpan(text: "がスレッドを立てました"));
        break;
      case NotificationType.BOARD_THREAD_REPLY:
        spans.add(const TextSpan(text: "がスレッドに返信しました"));
        break;
      case NotificationType.COMMUNITY_INVITE:
        spans.add(const TextSpan(text: "からコミュニティに招待されました"));
        break;
      case NotificationType.COMMUNITY_JOIN:
        spans.add(const TextSpan(text: "がコミュニティに参加しました"));
        break;
      case NotificationType.COMMUNITY_REMOVAL:
        spans.add(const TextSpan(text: "がコミュニティから外されました"));
        break;
      case NotificationType.REPORT_UPDATE:
        spans.add(const TextSpan(text: "通報の対応状況が更新されました"));
        break;
      case NotificationType.SYSTEM:
        spans.add(const TextSpan(text: "お知らせがあります"));
        break;
      // karotator が知らない種類。通知自体は落とさず素っ気なく出す。
      case NotificationType.UNKNOWN:
        spans.add(const TextSpan(text: "から通知が届いています"));
        break;
    }

    return Text.rich(TextSpan(children: spans));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initNotificationData,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.error != null) {
          return Center(child: Text('I got the error! ${snapshot.error}'));
        }

        return RefreshIndicator(
          onRefresh: refreshNotifications,
          child: ListView.builder(
            controller: controller,
            padding: const EdgeInsets.all(8),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: notifications.length + 1,
            itemBuilder: (context, index) {
              if (index == notifications.length) {
                return hasMore
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : const SizedBox.shrink();
              }

              final notification = notifications[index];
              final isLast = index == notifications.length - 1;

              return Column(
                children: [
                  ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(
                              username: notification.actor.username,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  (notification.actor.avatarUrl == null)
                                  ? AssetImage(
                                      "assets/images/default-avatar.png",
                                    )
                                  : NetworkImage(
                                      avatarUrlOf(notification.actor.avatarUrl),
                                    ),
                            ),
                            Positioned(
                              right: -4,
                              bottom: -4,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                                child: Icon(
                                  switch (notification.type) {
                                    NotificationType.LIKE => Icons.favorite,
                                    NotificationType.REPLY => Icons.comment,
                                    NotificationType.REKAROT => Icons.repeat,
                                    NotificationType.QUOTE =>
                                      Icons.format_quote,
                                    NotificationType.FOLLOW => Icons.person_add,
                                    NotificationType.MENTION =>
                                      Icons.alternate_email,
                                    NotificationType.FOLLOW_REQUEST =>
                                      Icons.person_search,
                                    NotificationType.DM => Icons.mail,
                                    NotificationType.BOARD_NEW_THREAD ||
                                    NotificationType.BOARD_THREAD_REPLY =>
                                      Icons.forum,
                                    NotificationType.SYSTEM ||
                                    NotificationType.REPORT_UPDATE =>
                                      Icons.campaign,
                                    _ => Icons.auto_awesome,
                                  },
                                  color: switch (notification.type) {
                                    NotificationType.LIKE => Colors.red,
                                    NotificationType.REPLY => Colors.blue,
                                    NotificationType.REKAROT => Colors.green,
                                    NotificationType.QUOTE => Colors.lightGreen,
                                    NotificationType.FOLLOW => Colors.blue,
                                    NotificationType.MENTION => Colors.purple,
                                    NotificationType.FOLLOW_REQUEST =>
                                      Colors.blueGrey,
                                    NotificationType.DM => Colors.teal,
                                    NotificationType.BOARD_NEW_THREAD ||
                                    NotificationType.BOARD_THREAD_REPLY =>
                                      Colors.brown,
                                    _ => Colors.orange,
                                  },
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () async {
                        if (notification.type != NotificationType.FOLLOW) {
                          if (notification.postCount <= 1) {
                            final post = await KarotterApi().posts.byId(
                              notification.post!.id,
                            );

                            if (!context.mounted) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PostDetailPage(post: post),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationPostsPage(
                                  notification: notification,
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: buildNotificationTitle(notification),
                    ),
                    subtitle: (notification.post == null)
                        ? null
                        : GestureDetector(
                            onTap: () async {
                              if (notification.postCount <= 1) {
                                final post = await KarotterApi().posts.byId(
                                  notification.post!.id,
                                );

                                if (!context.mounted) return;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PostDetailPage(post: post),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NotificationPostsPage(
                                      notification: notification,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              notification.post!.content,
                              style: TextStyle(fontSize: fontSize - 1),
                            ),
                          ),
                    trailing: Text(
                      getLocalizedDateTime(notification.createdAt),
                      style: TextStyle(fontSize: fontSize - 2),
                    ),
                  ),
                  if (!isLast) const Divider(height: 1),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
