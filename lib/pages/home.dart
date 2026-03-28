import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/pages/home/notification.dart";
import "package:karotator/pages/home/timeline.dart";
import "package:karotator/pages/login.dart";
import "package:karotator/pages/post.dart";
import "package:karotator/ui/drawer.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageKey = GlobalKey<ScaffoldState>();
  String? avatarUrl;
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    TimeLine(),
    TimeLine(),
    NotificationsPage(),
    NotificationsPage(),
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
          setState(() {
            _currentIndex = index;
          });
          // 通知タブ(index == 2 など)の場合の処理
          if (index == 2) {
            // 通知画面への遷移など
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
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
