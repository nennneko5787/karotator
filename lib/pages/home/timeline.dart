import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/ui/timeline_tab.dart";

class TimeLine extends StatefulWidget {
  const TimeLine({super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  String _followingMode = "latest";

  void showModeMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.schedule),
                title: const Text("時系列"),
                trailing: _followingMode == "latest"
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  setState(() => _followingMode = "latest");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text("おすすめ順"),
                trailing: _followingMode == "ranked"
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  setState(() => _followingMode = "ranked");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              GestureDetector(
                onLongPress: () => showModeMenu(context),
                child: Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      const Text("フォロー中"),
                      Icon(
                        _followingMode == "latest"
                            ? Icons.schedule
                            : Icons.star,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
              const Tab(text: 'おすすめ'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                TimeLineTab(
                  key: ValueKey(_followingMode),
                  fetcher: (page, limit) => HTTPClient().getTimeLine(
                    page: page,
                    limit: limit,
                    mode: _followingMode,
                  ),
                ),
                TimeLineTab(
                  fetcher: (page, limit) =>
                      HTTPClient().getRecommended(page: page, limit: limit),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
