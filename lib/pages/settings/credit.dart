import "package:flutter/material.dart";
import "package:karotator/ui/text_agent.dart";

class Credit extends StatefulWidget {
  const Credit({super.key});

  @override
  State<Credit> createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("クレジット")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/icon.png", width: 128),
              Text("Karotator", style: TextStyle(fontSize: 32)),
              Text("v2026.03.30 β"),
              Text.rich(TextAgent.generate("@Fng1Popn", context)),
              const SizedBox(height: 16.0),
              Text("★ Special thanks ★"),
              Text.rich(TextAgent.generate("@karon", context)),
              Text.rich(TextAgent.generate("@karotter", context)),
            ],
          ),
        ),
      ),
    );
  }
}
