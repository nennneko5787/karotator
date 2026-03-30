import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/pages/home/dm.dart";
import "package:karotator/pages/home/notification.dart";
import "package:karotator/pages/home/search.dart";
import "package:karotator/pages/home/timeline.dart";
import "package:karotator/pages/login.dart";
import "package:karotator/pages/post.dart";
import "package:karotator/ui/drawer.dart";
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageKey = GlobalKey<ScaffoldState>();
  String? avatarUrl;
  int _currentIndex = 0;
  int unReadCount = 0;

  static const List<Widget> _pages = [
    TimeLine(),
    Search(),
    NotificationsPage(),
    DM(),
  ];

  @override
  void initState() {
    super.initState();
    HTTPClient().loadLoginResponse().then(
      (response) => {
        setState(() {
          avatarUrl = response?.user.avatarUrl;
        }),
      },
    );
    if (HTTPClient().nowAccountId != null) {
      HTTPClient().getUnreadNotificationCount().then((count) {
        setState(() {
          unReadCount = count;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: pageKey,
      appBar: AppBar(
        title: CircleAvatar(
          backgroundImage: AssetImage('assets/images/icon.png'),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => {pageKey.currentState!.openDrawer()},
          icon: CircleAvatar(
            backgroundImage: NetworkImage(
              avatarUrl != null
                  ? "https://karotter.com$avatarUrl"
                  : "https://karotter.com/default-avatar.png",
            ),
          ),
        ),
      ),
      drawer: DrawerMenu(),
      drawerEnableOpenDragGesture: true,
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => (HTTPClient().nowAccountId == null)
                  ? LoginPage()
                  : PostPage(),
            ),
          ),
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index != 0 && HTTPClient().nowAccountId == null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
            return;
          }

          setState(() {
            _currentIndex = index;
          });

          if (index == 2) {
            HTTPClient().getUnreadNotificationCount().then((count) {
              setState(() {
                unReadCount = count;
              });
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
          BottomNavigationBarItem(
            icon: unReadCount > 0
                ? badges.Badge(
                    // notificationCountが0より大きい場合のみバッジを表示
                    badgeContent: Text(unReadCount.toString()),
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Colors.blue,
                    ),
                    child: const Icon(Icons.notifications),
                  )
                : const Icon(Icons.notifications),
            label: '通知',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'メッセージ',
          ),
        ],
      ),
    );
  }
}
