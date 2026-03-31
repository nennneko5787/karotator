import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/pages/login.dart";
import "package:karotator/pages/settings/account.dart";
import "package:karotator/pages/settings/appearance.dart";
import "package:karotator/pages/settings/credit.dart";
import "package:karotator/ui/settings/settings_list.dart";
import "package:karotator/ui/settings/settings_section.dart";
import "package:material_symbols_icons/symbols.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("設定")),
      body: SettingsList(
        children: [
          SettingsSection(
            leading: const Icon(Icons.person),
            title: "アカウント",
            subtitle: "メールアドレス・パスワードの管理を行います。",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (HTTPClient().nowAccountId == null)
                      ? LoginPage()
                      : AccountSettings(),
                ),
              );
            },
          ),
          SettingsSection(
            leading: const Icon(Symbols.brush),
            title: "表示",
            subtitle: "見た目や見えやすさなど、読みやすさを整えます。",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppearanceSettings()),
              );
            },
          ),
          SettingsSection(
            leading: const Icon(Icons.people),
            title: "クレジット",
            subtitle: "Karotatorを作った人たちを確認できます。",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Credit()),
              );
            },
          ),
        ],
      ),
    );
  }
}
