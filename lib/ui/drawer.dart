import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/response.dart";
import "package:karotator/objects/user.dart";
import "package:karotator/pages/login.dart";
import "package:karotator/pages/profile.dart";
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

    HTTPClient().loadLoginResponse().then(
      (response) => {
        setState(() {
          user = response?.user;
        }),
      },
    );

    HTTPClient().getAccountIds().then((accountIds) async {
      final newAccounts = <UserMeta>[];
      for (var accountId in accountIds) {
        if (accountId == HTTPClient().nowAccountId) continue;
        final response = await HTTPClient().loadLoginResponse(id: accountId);
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
                      user!.avatarUrl != null
                          ? "https://karotter.com${user!.avatarUrl}"
                          : "https://karotter.com/default-avatar.png",
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
                      account.response.user.avatarUrl != null
                          ? "https://karotter.com${account.response.user.avatarUrl}"
                          : "https://karotter.com/default-avatar.png",
                    ),
                  ),
                  title: Text(account.response.user.displayName),
                  subtitle: Text("@${account.response.user.username}"),
                  onTap: () {
                    HTTPClient().setAccountId(account.accountId);
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
                    await HTTPClient().removeAccountId(
                      HTTPClient().nowAccountId!,
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
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            accountName: user != null
                ? Text(user!.displayName)
                : Text("ログインしていません"),
            accountEmail: user != null
                ? Text("@${user!.username}")
                : Text("Karotterにログインして投稿を楽しみましょう"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                user?.avatarUrl != null
                    ? "https://karotter.com${user!.avatarUrl}"
                    : "https://karotter.com/default-avatar.png",
              ),
            ),
            otherAccountsPictures: [
              for (final account in otherAccounts.sublist(
                0,
                otherAccounts.length >= 3 ? 3 : otherAccounts.length,
              ))
                IconButton(
                  onPressed: () {
                    HTTPClient().setAccountId(account.accountId);
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
                          account.response.user.avatarUrl != null
                              ? "https://karotter.com${account.response.user.avatarUrl}"
                              : "https://karotter.com/default-avatar.png",
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
