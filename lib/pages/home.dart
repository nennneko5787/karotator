import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/pages/home/timeline.dart";
import "package:karotator/ui/drawer.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageKey = GlobalKey<ScaffoldState>();
  String? avatarUrl;

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
        title: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/karotter-log.png'),
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => {pageKey.currentState!.openDrawer()},
          icon: Container(
            width: 48,
            height: 48,
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
        ),
      ),
      drawer: DrawerMenu(),
      body: TimeLine(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
