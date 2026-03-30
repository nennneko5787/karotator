import "package:flutter/material.dart";

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  final Icon leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
