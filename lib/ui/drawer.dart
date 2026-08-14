import "package:karotator/const.dart";
import "package:flutter/material.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/objects/response.dart";
import "package:karotator/objects/user.dart";
import "package:karotator/pages/boards.dart";
import "package:karotator/pages/login.dart";
import "package:karotator/pages/profile.dart";
import "package:karotator/pages/settings.dart";
import "package:karotator/pages/startup.dart";

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class UserMeta {
  String accountId;
  LoginResponse response;

  UserMeta({required this.accountId, required this.response});
}

class _DrawerMenuState extends State<DrawerMenu> {
  AuthUser? user;
  List<UserMeta> otherAccounts = [];

  @override
  void initState() {
    super.initState();

    KarotterApi().session.login().then(
      (response) => {
        setState(() {
          user = response?.user;
        }),
      },
    );

    KarotterApi().session.accounts.ids().then((accountIds) async {
      final newAccounts = <UserMeta>[];
      for (var accountId in accountIds) {
        if (accountId == KarotterApi().session.accountId) continue;
        final response = await KarotterApi().session.loginOf(accountId);
        if (response == null) continue;

        newAccounts.add(UserMeta(accountId: accountId, response: response));
      }
      setState(() {
        otherAccounts = newAccounts;
      });
    });
  }

  void showAccountMenu() {
    final parentContext = context;

    showModalBottomSheet(
      context: context,
      builder: (bottomSheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (user != null)
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      avatarUrlOf(user?.avatarUrl),
                    ),
                  ),
                  title: Text(user!.displayName),
                  subtitle: Text("@${user!.username}"),
                  trailing: const Icon(Icons.check),
                ),
              const Divider(),
              for (final account in otherAccounts)
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      avatarUrlOf(account.response.user.avatarUrl),
                    ),
                  ),
                  title: Text(account.response.user.displayName),
                  subtitle: Text("@${account.response.user.username}"),
                  onTap: () {
                    KarotterApi().session.switchTo(account.accountId);
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      parentContext,
                      MaterialPageRoute(
                        builder: (parentContext) => StartUpPage(),
                      ),
                    );
                  },
                ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text("アカウントを追加"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    parentContext,
                    MaterialPageRoute(builder: (parentContext) => LoginPage()),
                  );
                },
              ),
              if (user != null)
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text("@${user!.username} からログアウト"),
                  onTap: () async {
                    Navigator.of(bottomSheetContext).pop();
                    await KarotterApi().session.removeAccount(
                      KarotterApi().session.accountId!,
                    );
                    await Future.delayed(Duration.zero);
                    if (!parentContext.mounted) return;
                    Navigator.of(parentContext).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => StartUpPage()),
                      (_) => false,
                    );
                  },
                ),
            ],
          ),
        );
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
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("設定"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ]
        : [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("プロフィール"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (parentContext) =>
                        ProfilePage(username: user!.username),
                  ),
                );
              },
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
              leading: const Icon(Icons.bookmark),
              title: const Text("掲示板"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (parentContext) => BoardsPage()),
                );
              },
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            accountName: user != null
                ? Text(
                    user!.displayName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  )
                : Text(
                    "ログインしていません",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
            accountEmail: user != null
                ? Text(
                    "@${user!.username}",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  )
                : Text(
                    "Karotterにログインして投稿を楽しみましょう",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                avatarUrlOf(user?.avatarUrl),
              ),
            ),
            otherAccountsPictures: [
              for (final account in otherAccounts.sublist(
                0,
                otherAccounts.length >= 3 ? 3 : otherAccounts.length,
              ))
                IconButton(
                  onPressed: () {
                    KarotterApi().session.switchTo(account.accountId);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => StartUpPage()),
                    );
                  },
                  icon: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          avatarUrlOf(account.response.user.avatarUrl),
                        ),
                      ),
                    ),
                  ),
                ),
              IconButton(
                onPressed: showAccountMenu,
                icon: const Icon(Icons.pending),
              ),
            ],
          ),
          ...actions,
        ],
      ),
    );
  }
}
