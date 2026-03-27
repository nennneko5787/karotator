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
  String _recommendMode = "algorithm";

  void showFollowingModeMenu(BuildContext context) {
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

  void showRecommendModeMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.schedule),
                title: const Text("最新"),
                trailing: _recommendMode == "latest"
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  setState(() => _recommendMode = "latest");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.analytics),
                title: const Text("アルゴリズム"),
                trailing: _recommendMode == "algorithm"
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  setState(() => _recommendMode = "algorithm");
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
                onLongPress: () => showFollowingModeMenu(context),
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
              GestureDetector(
                onLongPress: () => showRecommendModeMenu(context),
                child: Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      const Tab(text: 'おすすめ'),
                      Icon(
                        _recommendMode == "latest"
                            ? Icons.schedule
                            : Icons.analytics,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                TimeLineTab(
                  key: ValueKey(_followingMode),
                  fetcher: (cursor, limit) => HTTPClient().getTimeLine(
                    cursor: cursor,
                    limit: limit,
                    mode: _followingMode,
                  ),
                ),
                TimeLineTab(
                  key: ValueKey(_recommendMode),
                  isRecLatest: (_recommendMode == "latest"),
                  fetcher: (page, limit) => _recommendMode == "latest"
                      ? HTTPClient().getRecommendedLatest(
                          cursor: page,
                          limit: limit,
                        )
                      : HTTPClient().getRecommended(page: page!, limit: limit),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
