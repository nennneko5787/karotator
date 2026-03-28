import "package:flutter/material.dart";
import "package:karotator/objects/state.dart";

Future<void> showMediaSettings(BuildContext context, MediaState state) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return MediaSettings(state: state);
    },
  );
}

class MediaSettings extends StatefulWidget {
  const MediaSettings({super.key, required this.state});

  final MediaState state;

  @override
  State<MediaSettings> createState() => _MediaSettingsState();
}

class _MediaSettingsState extends State<MediaSettings> {
  late final TextEditingController _mediaAltController = TextEditingController(
    text: widget.state.alt,
  );
  late bool _spoiler = widget.state.spoiler;
  late bool _nsfw = widget.state.nsfw;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("メディアの設定"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _mediaAltController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'メディアの説明（Alt）',
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: _spoiler,
                onChanged: (bool? value) {
                  setState(() {
                    _spoiler = value!;
                  });
                },
              ),
              const Text("スポイラー"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: _nsfw,
                onChanged: (bool? value) {
                  setState(() {
                    _nsfw = value!;
                  });
                },
              ),
              const Text("R18（スポイラー）"),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            setState(() {
              widget.state.alt = _mediaAltController.text;
              widget.state.spoiler = _spoiler;
              widget.state.nsfw = _nsfw;
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
