import "package:flutter/material.dart";
import "package:karotator/ui/text_agent.dart";
import 'package:audioplayers/audioplayers.dart';

class Credit extends StatefulWidget {
  const Credit({super.key});

  @override
  State<Credit> createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  int _count = 0;
  bool yjsnpi = false;

  final _player = AudioPlayer();

  void tap() {
    _count++;

    if (_count >= 5 && !yjsnpi) {
      _count = 0;
      setState(() => yjsnpi = true);
      _player.play(AssetSource("sounds/810.mp3"));
    }

    if (_count >= 5 && yjsnpi) {
      _count = 0;
      setState(() => yjsnpi = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final kToolbarHeight = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(title: Text(yjsnpi ? "クレジット（野獣先輩モード）" : "クレジット")),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight:
                MediaQuery.of(context).size.height -
                kToolbarHeight -
                MediaQuery.of(context).padding.top,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    tap();
                  },
                  child: Image.asset(
                    yjsnpi ? "assets/images/810.jpg" : "assets/images/icon.png",
                    width: 128,
                  ),
                ),
                Text(
                  yjsnpi ? "野獣先輩" : "Karotator",
                  style: TextStyle(fontSize: 32),
                ),
                Text(yjsnpi ? "114514" : "v2026.03.30 β"),
                Text.rich(TextAgent.generate("@Fng1Popn", context)),
                const SizedBox(height: 16.0),
                Text(yjsnpi ? "謝らなければならない方々" : "★ Special thanks ★"),
                Text.rich(TextAgent.generate("@karon", context)),
                Text.rich(TextAgent.generate("@karotter", context)),
                if (yjsnpi) Text("そして、これを見てくださっている画面の前のあなた"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
