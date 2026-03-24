import "package:flutter/material.dart";
import "package:karotator/pages/home/timeline.dart";
import "package:karotator/ui/drawer.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: pageKey,
      appBar: AppBar(
        title: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/karotter-log.png'),
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => {pageKey.currentState!.openDrawer()},
          icon: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/default-avatar.png'),
              ),
            ),
          ),
        ),
      ),
      drawer: DrawerMenu(),
      body: TimeLine(),
    );
  }
}
