import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/board.dart";
import "package:karotator/pages/boards/threads.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/utils.dart";

class BoardsPage extends StatefulWidget {
  const BoardsPage({super.key});

  @override
  State<BoardsPage> createState() => _BoardsPageState();
}

class _BoardsPageState extends State<BoardsPage> {
  List<Board> boards = [];
  late Future<void> initBoardsData;

  @override
  void initState() {
    super.initState();
    initBoardsData = refreshBoards();
  }

  Future<void> refreshBoards() async {
    try {
      final boardsList = await HTTPClient().getBoards();

      setState(() {
        boards.addAll(boardsList);
      });
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");

      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("掲示板")),
      body: RefreshIndicator(
        onRefresh: refreshBoards,
        child: FutureBuilder(
          future: initBoardsData,
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.error != null) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: boards.length,
              itemBuilder: (context, index) {
                final board = boards[index];

                final child = ListTile(
                  title: Text(board.title),
                  subtitle: Text(
                    "${board.threadCount}スレ ${board.replyCount}レス ${getLocalizedDateTime(board.lastPostAt)}",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (parentContext) => ThreadsPage(board: board),
                      ),
                    );
                  },
                );

                if (index != 0 && index != boards.length) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [const Divider(height: 1, thickness: 1), child],
                  );
                }

                return child;
              },
            );
          },
        ),
      ),
    );
  }
}
