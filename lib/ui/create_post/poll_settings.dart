import 'package:flutter/material.dart';
import 'package:karotator/ui/create_post/poll_duration.dart';

class PollSettings extends StatefulWidget {
  const PollSettings({
    super.key,
    required this.onChanged,
    required this.onDurationChanged,
  });

  final void Function(List<String>) onChanged;
  final void Function(int) onDurationChanged;

  @override
  State<PollSettings> createState() => _PollSettingsState();
}

class _PollSettingsState extends State<PollSettings> {
  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  void onChanged() {
    widget.onChanged([for (var controller in _controllers) controller.text]);
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            const Text("投票", style: TextStyle(fontSize: 16)),
            for (var entry in _controllers.asMap().entries)
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: entry.value,
                      onChanged: (_) {
                        onChanged();
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: '選択肢${entry.key + 1}',
                      ),
                    ),
                  ),
                  if (_controllers.length > 2)
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _controllers.remove(entry.value);
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controllers.add(TextEditingController());
                });
              },
              child: const Text("選択肢を追加"),
            ),
            PollDurationMenu(onChanged: widget.onDurationChanged),
          ],
        ),
      ),
    );
  }
}
