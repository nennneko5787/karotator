import "package:flutter/material.dart";

class DM extends StatefulWidget {
  const DM({super.key});

  @override
  State<DM> createState() => _DMState();
}

class _DMState extends State<DM> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("(=^・ω・^=)", style: TextStyle(fontSize: 32)),
          Text("未実装です"),
        ],
      ),
    );
  }
}
