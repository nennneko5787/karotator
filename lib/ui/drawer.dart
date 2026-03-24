import "package:flutter/material.dart";
import "package:karotator/pages/login.dart";

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("ログインしていません"),
            accountEmail: Text("Karotterにログインして投稿を楽しみましょう"),
          ),
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
        ],
      ),
    );
  }
}
