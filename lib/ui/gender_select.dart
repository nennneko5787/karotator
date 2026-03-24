import 'package:flutter/material.dart';

const List<List<String>> choices = [
  ["OTHER", "その他"],
  ["MALE", "男性"],
  ["FEMALE", "女性"],
];

class GenderSelectMenu extends StatefulWidget {
  const GenderSelectMenu({super.key});

  @override
  State<GenderSelectMenu> createState() => _GenderSelectMenuState();
}

class _GenderSelectMenuState extends State<GenderSelectMenu> {
  String selected = choices.first[0];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text("性別（任意）"),
      subtitle: SizedBox(
        child: DropdownButton(
          items: choices.map((choice) {
            return DropdownMenuItem(value: choice[0], child: Text(choice[1]));
          }).toList(),
          value: selected,
          onChanged: (String? value) {
            setState(() {
              selected = value!;
            });
          },
          isExpanded: true,
          hint: const Text(
            "性別（任意）",
            style: TextStyle(color: Colors.black, fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
