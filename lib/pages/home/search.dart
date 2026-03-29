import "package:flutter/material.dart";

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("(='X'=)", style: TextStyle(fontSize: 32)),
          Text("未実装です"),
        ],
      ),
    );
  }
}
