import "package:flutter/material.dart";
import "package:karotator/factory/post.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/post.dart";

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
    initPostsData = refreshPosts();
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
                leading: postUserAvatarFactory(post.author.avatarUrl),
                title: postUserDetailFactory(post),
                subtitle: postContentFactory(post),
              );
            },
          ),
        );
      },
    );
  }
}
