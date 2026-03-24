import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/utils.dart";

class TimeLine extends StatefulWidget {
  const TimeLine({super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  final pageKey = GlobalKey<ScaffoldState>();
  late List<Post> posts;
  late Future<void> initPostsData;

  @override
  void initState() {
    super.initState();
    initPostsData = initPosts();
  }

  Future<void> initPosts() async {
    final response = await HTTPClient().getRecommended(page: 1, limit: 12);
    posts = response.posts;
  }

  Future<void> refreshPosts() async {
    final response = await HTTPClient().getRecommended(page: 1, limit: 12);
    setState(() {
      posts = response.posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initPostsData,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.error != null) {
          return Center(child: Text('I got the error! ${snapshot.error}'));
        }

        return RefreshIndicator(
          onRefresh: refreshPosts,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
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
                      getLocalizedDateTime(post.createdAt),
                      style: TextStyle(
                        color: Color.fromARGB(255, 107, 114, 128),
                      ),
                    ),
                  ],
                ),
                subtitle: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.content),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.comment_outlined),
                                onPressed: () {},
                              ),
                              Text("${post.repliesCount}"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.repeat),
                                onPressed: () {},
                              ),
                              Text("${post.rekarotsCount}"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.favorite_outline),
                                onPressed: () {},
                              ),
                              Text("${post.likesCount}"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.bookmark_outline),
                                onPressed: () {},
                              ),
                              Text("${post.bookmarksCount}"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
