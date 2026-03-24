import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/response.dart";

class TimeLine extends StatefulWidget {
  const TimeLine({super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  final pageKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HTTPClient().getRecommended(page: 1, limit: 12),
      builder: (BuildContext context, AsyncSnapshot<RecommendedResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.error != null) {
          return Center(child: Text('I got the error! ${snapshot.error}'));
        }

        final response = snapshot.data;

        if (response == null) {
          return Center(child: Text('Request successful but response is null'));
        }

        return RefreshIndicator(
          onRefresh: () async => {},
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: response.posts.length,
            itemBuilder: (context, index) {
              final post = response.posts[index];
              return ListTile(
                titleAlignment: ListTileTitleAlignment.top,
                leading: Wrap(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            post.author.avatarUrl != null
                                ? "https://karotter.com${post.author.avatarUrl}"
                                : "https://karotter.com/default-avatar.png",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                title: Row(
                  children: [
                    Text(post.author.displayName),
                    const SizedBox(width: 8),
                    Text(
                      "@${post.author.username}",
                      style: TextStyle(
                        color: Color.fromARGB(255, 107, 114, 128),
                      ),
                    ),
                    Text(
                      " · ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 107, 114, 128),
                      ),
                    ),
                    Text(
                      post.createdAt.toString(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 107, 114, 128),
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.content),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.comment_outlined),
                          onPressed: () {},
                        ),
                        Text("${post.repliesCount}"),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.repeat),
                          onPressed: () {},
                        ),
                        Text("${post.rekarotsCount}"),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.favorite_outline),
                          onPressed: () {},
                        ),
                        Text("${post.likesCount}"),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.bookmark_outline),
                          onPressed: () {},
                        ),
                        Text("${post.bookmarksCount}"),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
