import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/enum.dart";
import "package:karotator/providers/emoji_style.dart";
import "package:karotator/providers/font.dart";
import "package:karotator/providers/font_size.dart";
import "package:karotator/providers/theme.dart";
import "package:karotator/providers/ui_scale.dart";
import "package:karotator/ui/settings/font_size.dart";
import "package:karotator/ui/settings/settings_list.dart";
import "package:karotator/ui/settings/settings_section.dart";
import "package:karotator/ui/settings/ui_scale.dart";
import "package:karotator/utils.dart";
import "package:material_symbols_icons/symbols.dart";

class AppearanceSettings extends ConsumerStatefulWidget {
  const AppearanceSettings({super.key});

  @override
  ConsumerState<AppearanceSettings> createState() => _AppearanceSettingsState();
}

class _AppearanceSettingsState extends ConsumerState<AppearanceSettings> {
  @override
  void initState() {
    super.initState();
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
                for (var fontName in fonts)
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

  void showEmojiStyleSettingMenu(
    BuildContext context, {
    required EmojiStyle style,
    required EmojiStyleNotifier notifier,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final choice in EmojiStyle.values)
                ListTile(
                  // 選択肢自体をその絵柄で描く。見比べて選べるように。
                  leading: Text(
                    "😀",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamilyFallback: [?choice.fontFamily],
                    ),
                  ),
                  title: Text(choice.label),
                  subtitle: Text(_emojiStyleDescription(choice)),
                  trailing: style == choice ? const Icon(Icons.check) : null,
                  onTap: () {
                    notifier.setEmojiStyle(choice);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  static String _emojiStyleDescription(EmojiStyle style) => switch (style) {
    EmojiStyle.native => "端末が持っている絵文字をそのまま使う。",
    EmojiStyle.twemoji => "Twitter と同じ絵柄。同梱しているのでどの端末でも同じに見える。",
  };

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
    final uiScale = ref.watch(uiScaleProvider);

    final emojiStyle = ref.watch(emojiStyleProvider);
    final emojiStyleNotifier = ref.watch(emojiStyleProvider.notifier);

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
          SettingsSection(
            leading: const Icon(Symbols.zoom_out_map),
            title: "UI サイズ",
            subtitle: "文字も含めて、画面全体の大きさを変える。",
            trailing: Text("${(uiScale * 100).round()}%"),
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => const UiScaleBottomSheet(),
            ),
          ),
          SettingsSection(
            leading: const Icon(Symbols.mood),
            title: "絵文字",
            subtitle: "好きな絵柄で。本文もリアクションもまとめて変わる。",
            trailing: Text(
              emojiStyle.label,
              style: TextStyle(fontFamilyFallback: [?emojiStyle.fontFamily]),
            ),
            onTap: () {
              showEmojiStyleSettingMenu(
                context,
                style: emojiStyle,
                notifier: emojiStyleNotifier,
              );
            },
          ),
        ],
      ),
    );
  }
}
