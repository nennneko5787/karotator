import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/user.dart";
import "package:karotator/pages/login.dart";

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  AuthUser? user;

  @override
  void initState() {
    super.initState();

    HTTPClient().loadLoginResponse().then(
      (response) => {
        setState(() {
          user = response?.user;
        }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final actions = user == null
        ? [
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text("ログイン"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ]
        : [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("プロフィール"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text("ブックマーク"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text("サークル/リスト"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.brush),
              title: const Text("絵チャット"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.mic),
              title: const Text("スペース"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("設定"),
              onTap: () {},
            ),
          ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: user != null
                ? Text(user!.displayName)
                : const Text("ログインしていません"),
            accountEmail: user != null
                ? Text("@${user!.username}")
                : const Text("Karotterにログインして投稿を楽しみましょう"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                user?.avatarUrl != null
                    ? "https://karotter.com${user!.avatarUrl}"
                    : "https://karotter.com/default-avatar.png",
              ),
            ),
          ),
          ...actions,
        ],
      ),
    );
  }
}
