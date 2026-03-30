import "package:flutter/material.dart";

class SettingsList extends StatelessWidget {
  const SettingsList({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: children));
  }
}
