import 'package:flutter/material.dart';

const List<int> choices = [1, 6, 24, 24 * 3, 24 * 7];

class PollDurationMenu extends StatefulWidget {
  const PollDurationMenu({super.key, this.onChanged});

  final ValueChanged<int>? onChanged;

  @override
  State<PollDurationMenu> createState() => _PollDurationMenuState();
}

class _PollDurationMenuState extends State<PollDurationMenu> {
  int selected = choices.first;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text("投票期間"),
      subtitle: SizedBox(
        child: DropdownButton(
          items: choices.map((choice) {
            return DropdownMenuItem(value: choice, child: Text("$choice時間"));
          }).toList(),
          value: selected,
          onChanged: (int? value) {
            setState(() {
              selected = value!;
            });
            widget.onChanged?.call(value!);
          },
          isExpanded: true,
          hint: const Text("投票期間", textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
