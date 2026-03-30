import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/providers/font.dart";
import "package:karotator/providers/font_size.dart";
import "package:karotator/providers/theme.dart";
import "package:karotator/ui/settings/font_size.dart";
import "package:karotator/ui/settings/settings_list.dart";
import "package:karotator/ui/settings/settings_section.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:system_fonts/system_fonts.dart";

class AppearanceSettings extends ConsumerStatefulWidget {
  const AppearanceSettings({super.key});

  @override
  ConsumerState<AppearanceSettings> createState() => _AppearanceSettingsState();
}

class _AppearanceSettingsState extends ConsumerState<AppearanceSettings> {
  List<String>? allFonts;

  @override
  void initState() {
    super.initState();
    getAllFonts();
  }

  Future<void> getAllFonts() async {
    allFonts = await SystemFonts().loadAllFonts();
  }

  void showThemeSettingMenu(
    BuildContext context, {
    required ThemeMode theme,
    required ThemeModeNotifier notifier,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.contrast),
                title: const Text("自動"),
                trailing: theme == ThemeMode.system
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  notifier.setThemeMode(ThemeMode.system);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.light_mode),
                title: const Text("ライト"),
                trailing: theme == ThemeMode.light
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  notifier.setThemeMode(ThemeMode.light);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("ダーク"),
                trailing: theme == ThemeMode.dark
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  notifier.setThemeMode(ThemeMode.dark);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showFontSettingMenu(
    BuildContext context, {
    required String? font,
    required FontNotifier notifier,
  }) {
    if (allFonts == null) return;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.font_download),
                  title: Text("デフォルト", style: TextStyle(fontFamily: null)),
                  trailing: font == null ? const Icon(Icons.check) : null,
                  onTap: () {
                    notifier.setFont(null);
                    Navigator.pop(context);
                  },
                ),
                for (var fontName in allFonts!)
                  ListTile(
                    leading: const Icon(Icons.font_download),
                    title: Text(
                      fontName,
                      style: TextStyle(fontFamily: fontName),
                    ),
                    trailing: font == fontName ? const Icon(Icons.check) : null,
                    onTap: () {
                      notifier.setFont(fontName);
                      Navigator.pop(context);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showFontSizeSettingMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const FontSizeBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeModeProvider);
    final themeNotifier = ref.watch(themeModeProvider.notifier);

    final font = ref.watch(fontProvider);
    final fontNotifier = ref.watch(fontProvider.notifier);

    final fontSize = ref.watch(fontSizeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("表示設定")),
      body: SettingsList(
        children: [
          SettingsSection(
            leading: const Icon(Icons.light_mode),
            title: "テーマ",
            subtitle: "目に優しく、スマホに優しく。",
            trailing: theme == ThemeMode.system
                ? const Text("自動")
                : theme == ThemeMode.light
                ? const Text("ライト")
                : const Text("ダーク"),
            onTap: () {
              showThemeSettingMenu(
                context,
                theme: theme,
                notifier: themeNotifier,
              );
            },
          ),
          SettingsSection(
            leading: const Icon(Symbols.font_download),
            title: "フォント",
            subtitle: "お気に入りのフォントで、快適に。",
            trailing: Text(font ?? "デフォルト", style: TextStyle(fontFamily: font)),
            onTap: () {
              if (allFonts == null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("フォントをロード中...")));
                return;
              }
              showFontSettingMenu(context, font: font, notifier: fontNotifier);
            },
          ),
          SettingsSection(
            leading: const Icon(Symbols.format_size),
            title: "フォントサイズ",
            subtitle: "見やすさを取るか、効率を取るか。",
            trailing: Text("${(fontSize * 100).floor()}%"),
            onTap: () {
              showFontSizeSettingMenu(context);
            },
          ),
        ],
      ),
    );
  }
}
