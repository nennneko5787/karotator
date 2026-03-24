import "package:flutter/material.dart";

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text("メニュー1"),
            onTap: () {
              // ここにメニュータップ時の処理を記述
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text("メニュー2"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("メニュー3"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
