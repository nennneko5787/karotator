import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/user.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.username});

  final String username;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  bool isFollowedBy = false;
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    final response = await HTTPClient().getUserByUsername(widget.username);
    setState(() {
      user = response.user;
      isFollowedBy = response.isFollowedBy;
      isFollowing = response.isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (user == null)
            ? const Text("ユーザー")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user!.displayName),
                  Text(
                    "${user!.postsCount} カロート",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: (user == null)
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: (user!.headerUrl != null)
                            ? Image.network(
                                "https://karotter.com${user!.headerUrl}",
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.width * 0.33,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.width * 0.33,
                                color: const Color(0xFFDCE8F0),
                              ),
                      ),
                      Positioned(
                        bottom: -40,
                        left: 16,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 4,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: (user!.avatarUrl != null)
                                ? NetworkImage(
                                    "https://karotter.com${user!.avatarUrl}",
                                  )
                                : null,
                            child: (user!.avatarUrl == null)
                                ? Image.asset(
                                    "assets/images/default-avatar.png",
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                user!.displayName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .apply(fontWeightDelta: 50),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "@${user!.username}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(
                                          color: Theme.of(
                                            context,
                                          ).secondaryHeaderColor,
                                        ),
                                  ),
                                  const SizedBox(width: 8),
                                  if (isFollowedBy) const Text("フォローされています"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      isFollowing
                          ? OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text("フォロー中"),
                            )
                          : ElevatedButton(
                              onPressed: () {},
                              child: const Text("フォロー"),
                            ),
                      SizedBox(width: 12),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Text(user!.bio),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (user!.location != null)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Theme.of(
                                      context,
                                    ).secondaryHeaderColor,
                                  ),
                                  Text(
                                    user!.location!,
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).secondaryHeaderColor,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
