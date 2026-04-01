import 'dart:convert';
import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as httpx;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:karotator/enum.dart';
import 'package:karotator/objects/board.dart';
import 'package:karotator/objects/circle.dart';
import 'package:karotator/objects/post.dart';
import 'package:karotator/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/v4.dart';

import 'package:karotator/exceptions.dart';
import 'package:karotator/objects/response.dart';

class HTTPClient {
  static final HTTPClient _instance = HTTPClient._internal();
  HTTPClient._internal();

  factory HTTPClient() {
    return _instance;
  }

  final http = httpx.Client();
  final storage = const FlutterSecureStorage();
  bool initialized = false;
  String? nowAccountId;
  int? nowUserId;
  final baseUrl = "https://api.karotter.com/api/";

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    nowAccountId = prefs.getString("nowAccountId");

    if (nowAccountId != null) {
      nowUserId = (await loadLoginResponse())!.user.id;
    }

    initialized = true;
  }

  Map<String, String> parseCookies(String raw) {
    const metaAttrs = {
      'expires',
      'path',
      'domain',
      'secure',
      'httponly',
      'samesite',
      'max-age',
    };
    final cookies = <String, String>{};
    for (final part in raw.split(';')) {
      final eq = part.trim().indexOf('=');
      if (eq == -1) continue;
      final key = part.trim().substring(0, eq).trim().toLowerCase();
      if (metaAttrs.contains(key)) continue;
      cookies[key] = part.trim().substring(eq + 1).trim();
    }
    return cookies;
  }

  Future<void> commonOperaion(httpx.BaseResponse response) async {
    if (nowAccountId == null) return;

    final setCookies = response.headersSplitValues['set-cookie'];
    if (setCookies == null) return;

    final existing = parseCookies(
      await storage.read(key: "${nowAccountId}_cookies") ?? '',
    );
    for (var cookie in setCookies) {
      existing.addAll(parseCookies(cookie));
    }

    await storage.write(
      key: "${nowAccountId}_cookies",
      value: existing.entries.map((e) => '${e.key}=${e.value}').join('; '),
    );
  }

  Future<void> afterRequest(httpx.Response response) async {
    if ((response.statusCode >= 400) && (response.statusCode <= 499)) {
      throw KarotterClientException(
        response.statusCode,
        utf8.decode(response.bodyBytes),
      );
    } else if ((response.statusCode >= 500) && (response.statusCode <= 599)) {
      throw KarotterServerException(
        response.statusCode,
        utf8.decode(response.bodyBytes),
      );
    }

    await commonOperaion(response);
  }

  Future<void> afterRequestStreamed(
    httpx.StreamedResponse response,
    String? bodyString,
  ) async {
    if ((response.statusCode >= 400) && (response.statusCode <= 499)) {
      throw KarotterClientException(response.statusCode, bodyString ?? "");
    } else if ((response.statusCode >= 500) && (response.statusCode <= 599)) {
      throw KarotterServerException(response.statusCode, bodyString ?? "");
    }

    await commonOperaion(response);
  }

  Future<Map<String, String>> cookieHeaders() async {
    if (nowAccountId == null) return {};

    final stored = await storage.read(key: "${nowAccountId}_cookies");
    if (stored == null || stored.isEmpty) return {};
    return {'Cookie': stored};
  }

  Future<List<String>> getAccountIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("accountIds") ?? [];
  }

  Future<void> setAccountId(String id) async {
    nowAccountId = id;

    final prefs = await SharedPreferences.getInstance();

    final accountIds = prefs.getStringList("accountIds") ?? [];
    if (!accountIds.contains(id)) {
      accountIds.add(id);
      await prefs.setStringList("accountIds", accountIds);
    }

    await prefs.setString("nowAccountId", id);
  }

  Future<String> createAccountId() async {
    final id = UuidV4().generate();
    await setAccountId(id);
    return id;
  }

  Future<void> removeAccountId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final accountIds = prefs.getStringList("accountIds") ?? [];
    accountIds.remove(id);
    await prefs.setStringList("accountIds", accountIds);
    await storage.delete(key: "${id}_cookies");
    await storage.delete(key: "${id}_login");

    if (nowAccountId == id) {
      nowAccountId = accountIds.firstOrNull;
      if (nowAccountId != null) {
        await prefs.setString("nowAccountId", nowAccountId!);
      } else {
        await prefs.remove("nowAccountId");
      }
    }
  }

  Future<void> saveLoginResponse(LoginResponse res) async {
    if (nowAccountId == null) return;
    final jsonStr = jsonEncode(res.toJson());
    await storage.write(key: "${nowAccountId}_login", value: jsonStr);
  }

  Future<void> modifyLoginResponse(RefreshResponse res) async {
    if (nowAccountId == null) return;
    final jsonStr = await storage.read(key: "${nowAccountId}_login");
    if (jsonStr == null) return;

    final decoded = jsonDecode(jsonStr);
    if (decoded is! Map<String, dynamic>) return;

    decoded["accessToken"] = res.accessToken;
    decoded["sessionId"] = res.sessionId;

    await storage.write(
      key: "${nowAccountId}_login",
      value: jsonEncode(decoded),
    );
  }

  Future<LoginResponse?> loadLoginResponse({String? id}) async {
    id ??= nowAccountId;
    if (id == null) return null;
    final jsonStr = await storage.read(key: "${id}_login");
    if (jsonStr == null) return null;

    final decoded = jsonDecode(jsonStr);
    if (decoded is! Map<String, dynamic>) return null;
    return LoginResponse.fromJson(decoded);
  }

  Future<Map<String, String>> getDeviceIdHeader() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("deviceId")) {
      prefs.setString("deviceId", UuidV4().generate());
    }
    return {"x-device-id": prefs.getString("deviceId")!};
  }

  Future<String> fetchCsrfToken() async {
    final csrfToken = (await get("auth/csrf-token"))["csrfToken"] as String;

    final existing = parseCookies(
      await storage.read(key: "${nowAccountId}_cookies") ?? '',
    );
    existing["karotter_csrf"] = csrfToken;
    await storage.write(
      key: "${nowAccountId}_cookies",
      value: existing.entries.map((e) => '${e.key}=${e.value}').join('; '),
    );

    return csrfToken;
  }

  Future<Map<String, Object?>> get(
    String url, {
    Map<String, String>? headers,
    bool csrf = false,
  }) async {
    final deviceId = await getDeviceIdHeader();

    final login = await loadLoginResponse();
    Map authorization = {};
    if (login != null) {
      authorization = {"Authorization": "Bearer ${login.accessToken}"};
    }

    Map csrfHeader = {};
    if (csrf) {
      csrfHeader = {"x-csrf-token": await fetchCsrfToken()};
    }

    final cookies = await cookieHeaders();

    final response = await http.get(
      Uri.parse("$baseUrl$url"),
      headers: {
        ...cookies,
        ...deviceId,
        ...authorization,
        ...csrfHeader,
        ...?headers,
        "x-client-type": "unofficial_app",
      },
    );

    debugPrint(
      "req-headers: ${{...cookies, ...deviceId, ...authorization, ...csrfHeader, ...?headers, "x-client-type": "unofficial_app"}}",
    );
    debugPrint("status: ${response.statusCode}");
    debugPrint("body: ${utf8.decode(response.bodyBytes)}");

    await afterRequest(response);
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, Object?>;
  }

  Future<Map<String, Object?>> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
    bool csrf = false,
  }) async {
    final deviceId = await getDeviceIdHeader();

    final login = await loadLoginResponse();
    Map authorization = {};
    if (login != null) {
      authorization = {"Authorization": "Bearer ${login.accessToken}"};
    }

    Map csrfHeader = {};
    if (csrf) {
      csrfHeader = {"x-csrf-token": await fetchCsrfToken()};
    }

    final cookies = await cookieHeaders();

    final response = await http.post(
      Uri.parse("$baseUrl$url"),
      headers: {
        ...cookies,
        ...deviceId,
        ...authorization,
        ...csrfHeader,
        ...?headers,
        "x-client-type": "unofficial_app",
      },
      body: body,
    );

    debugPrint(
      "req-headers: ${{...cookies, ...deviceId, ...authorization, ...csrfHeader, ...?headers, "x-client-type": "unofficial_app"}}",
    );
    debugPrint("status: ${response.statusCode}");
    debugPrint("body: ${utf8.decode(response.bodyBytes)}");

    await afterRequest(response);
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, Object?>;
  }

  Future<Map<String, Object?>> patch(
    String url, {
    Map<String, String>? headers,
    Object? body,
    bool csrf = false,
  }) async {
    final deviceId = await getDeviceIdHeader();

    final login = await loadLoginResponse();
    Map authorization = {};
    if (login != null) {
      authorization = {"Authorization": "Bearer ${login.accessToken}"};
    }

    Map csrfHeader = {};
    if (csrf) {
      csrfHeader = {"x-csrf-token": await fetchCsrfToken()};
    }

    final cookies = await cookieHeaders();

    final response = await http.patch(
      Uri.parse("$baseUrl$url"),
      headers: {
        ...cookies,
        ...deviceId,
        ...authorization,
        ...csrfHeader,
        ...?headers,
        "x-client-type": "unofficial_app",
      },
      body: body,
    );

    debugPrint(
      "req-headers: ${{...cookies, ...deviceId, ...authorization, ...csrfHeader, ...?headers, "x-client-type": "unofficial_app"}}",
    );
    debugPrint("status: ${response.statusCode}");
    debugPrint("body: ${utf8.decode(response.bodyBytes)}");

    await afterRequest(response);
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, Object?>;
  }

  Future<Map<String, Object?>> delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
    bool csrf = false,
  }) async {
    final deviceId = await getDeviceIdHeader();

    final login = await loadLoginResponse();
    Map authorization = {};
    if (login != null) {
      authorization = {"Authorization": "Bearer ${login.accessToken}"};
    }

    Map csrfHeader = {};
    if (csrf) {
      csrfHeader = {"x-csrf-token": await fetchCsrfToken()};
    }

    final cookies = await cookieHeaders();

    final response = await http.delete(
      Uri.parse("$baseUrl$url"),
      headers: {
        ...cookies,
        ...deviceId,
        ...authorization,
        ...csrfHeader,
        ...?headers,
        "x-client-type": "unofficial_app",
      },
      body: body,
    );

    debugPrint(
      "req-headers: ${{...cookies, ...deviceId, ...authorization, ...csrfHeader, ...?headers, "x-client-type": "unofficial_app"}}",
    );
    debugPrint("status: ${response.statusCode}");
    // debugPrint("body: ${utf8.decode(response.bodyBytes)}");

    await afterRequest(response);
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, Object?>;
  }

  Future<RecommendedResponse> getRecommended({
    required int page,
    required int limit,
    required String mode,
  }) async {
    final jsonData = await get(
      "posts/recommended?page=$page&limit=$limit&mode=$mode",
    );
    return RecommendedResponse.fromJson(jsonData);
  }

  Future<RecommendedResponseLatest> getRecommendedLatest({
    required int? cursor,
    required int limit,
  }) async {
    final jsonData = await get(
      "posts/recommended?cursor=${cursor ?? ""}&limit=$limit&mode=latest",
    );
    return RecommendedResponseLatest.fromJson(jsonData);
  }

  Future<TimeLineResponse> getTimeLine({
    required int page,
    required int limit,
    required String mode,
  }) async {
    final jsonData = await get(
      "posts/timeline?page=$page&limit=$limit&mode=$mode",
    );
    return TimeLineResponse.fromJson(jsonData);
  }

  Future<RecommendedResponse> getPostsByUserId({
    required int? userId,
    required int page,
    required int limit,
  }) async {
    final jsonData = await get("users/$userId/posts?page=$page&limit=$limit");
    return RecommendedResponse.fromJson(jsonData);
  }

  Future<RecommendedResponse> getUserRepliesByUserId({
    required int? userId,
    required int page,
    required int limit,
  }) async {
    final jsonData = await get("users/$userId/replies?page=$page&limit=$limit");
    return RecommendedResponse.fromJson(jsonData);
  }

  Future<RecommendedResponse> getUserMediasByUserId({
    required int? userId,
    required int page,
    required int limit,
  }) async {
    final jsonData = await get("users/$userId/media?page=$page&limit=$limit");
    return RecommendedResponse.fromJson(jsonData);
  }

  Future<RecommendedResponse> getUserLikesByUserId({
    required int? userId,
    required int page,
    required int limit,
  }) async {
    final jsonData = await get("users/$userId/likes?page=$page&limit=$limit");
    return RecommendedResponse.fromJson(jsonData);
  }

  Future<LoginResponse> login({
    required String identifier,
    required String password,
    required String gender,
  }) async {
    final id = await createAccountId();

    try {
      final jsonData = await post(
        "auth/login",
        headers: {"content-type": "application/json"},
        body: jsonEncode({
          "identifier": identifier,
          "password": password,
          "gender": gender,
          "deviceId": (await getDeviceIdHeader())["x-device-id"],
          "clientType": "unofficial_app",
          "deviceName": "Karotator on ${Platform.operatingSystem}",
        }),
      );
      final response = LoginResponse.fromJson(jsonData);
      nowUserId = response.user.id;
      await saveLoginResponse(response);
      return response;
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      await removeAccountId(id);
      rethrow;
    }
  }

  Future<RefreshResponse> refresh() async {
    final jsonData = await post(
      "auth/refresh",
      headers: {"content-type": "application/json"},
      csrf: true,
    );
    final response = RefreshResponse.fromJson(jsonData);
    await modifyLoginResponse(response);
    return response;
  }

  Future<RefreshResponse> switchSession() async {
    final loginResponse = await loadLoginResponse();
    final jsonData = await post(
      "auth/switch-session",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "clientType": "unofficial_app",
        "deviceName": "Karotator on ${Platform.operatingSystem}",
        "deviceId": loginResponse!.deviceId,
        "sessionId": loginResponse.sessionId,
        "userId": loginResponse.user.id,
      }),
      csrf: true,
    );
    final response = RefreshResponse.fromJson(jsonData);
    await modifyLoginResponse(response);
    return response;
  }

  Future<void> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    final _ = await patch(
      "users/password",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      }),
      csrf: true,
    );
  }

  Future<Post> getPostById(int postId) async {
    final jsonData = await get("posts/$postId");
    return Post.fromJson(jsonData["post"] as Map<String, dynamic>);
  }

  Future<void> like(int postId) async {
    final _ = await post("posts/$postId/like");
  }

  Future<void> dislike(int postId) async {
    final _ = await delete("posts/$postId/like");
  }

  Future<void> rekarot(int postId) async {
    final _ = await post("posts/$postId/rekarot");
  }

  Future<void> unrekarot(int postId) async {
    final _ = await delete("posts/$postId/rekarot");
  }

  Future<void> bookmark(int postId) async {
    final _ = await post("posts/$postId/bookmark");
  }

  Future<void> unbookmark(int postId) async {
    final _ = await delete("posts/$postId/bookmark");
  }

  Future<void> react(int postId, {required String emoji}) async {
    final _ = await post(
      "posts/$postId/react",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"emoji": emoji}),
    );
  }

  Future<void> unreact(int postId, {required String emoji}) async {
    final encodedEmoji = Uri.encodeComponent(emoji);
    final _ = await delete("posts/$postId/react/$encodedEmoji");
  }

  Future<Poll> poll(int postId, {required int optionId}) async {
    final jsonData = await post(
      "posts/$postId/poll/vote",
      headers: {"content-type": "application/json"},
      body: jsonEncode({"optionId": optionId}),
    );
    return Poll.fromJson(jsonData["poll"] as Map<String, Object?>);
  }

  Future<RepliesResponse> getReplies({
    required int postId,
    required int page,
    required int limit,
  }) async {
    final jsonData = await get("posts/$postId/replies?page=$page&limit=$limit");
    return RepliesResponse.fromJson(jsonData);
  }

  Future<Post> createPost(
    String content, {
    bool isAiGenerated = false,
    bool isPromotional = false,
    bool isR18 = false,
    bool hideFromMinors = false,
    PostVisibility visibility = PostVisibility.PUBLIC,
    int? viewerCircleId,
    ReplyRestriction replyRestriction = ReplyRestriction.EVERYONE,
    int? replyCircleId,
    List<String>? mediaAlts,
    List<bool>? mediaSpoilerFlags,
    List<bool>? mediaR18Flags,
    List<String>? pollOptions,
    int? pollDurationHours,
    DateTime? scheduledFor,
    List<File>? medias,
    int? parentId,
    int? quotedPostId,
  }) async {
    // setting up my attr
    mediaAlts ??= [];
    mediaSpoilerFlags ??= [];
    mediaR18Flags ??= [];

    final request = httpx.MultipartRequest(
      'POST',
      Uri.parse("${baseUrl}posts"),
    );

    final deviceId = await getDeviceIdHeader();

    final login = await loadLoginResponse();
    final cookies = await cookieHeaders();

    final headers = <String, String>{
      ...cookies,
      ...deviceId,
      "Authorization": "Bearer ${login!.accessToken}",
      "x-csrf-token": await fetchCsrfToken(),
      "x-client-type": "unofficial_app",
    };
    request.headers.addAll(headers);

    Map<String, String> data = {
      "content": content,
      "isAiGenerated": isAiGenerated.toString(),
      "isPromotional": isPromotional.toString(),
      "isR18": isR18.toString(),
      "hideFromMinors": hideFromMinors.toString(),
      "visibility": visibility.name,
      "replyRestriction": replyRestriction.name,
      "mediaAlts": jsonEncode(mediaAlts),
      "mediaSpoilerFlags": jsonEncode(mediaSpoilerFlags),
      "mediaR18Flags": jsonEncode(mediaR18Flags),
    };

    if (visibility == PostVisibility.CIRCLE) {
      data.addAll({"viewerCircleId": viewerCircleId.toString()});
    }
    if (replyRestriction == ReplyRestriction.CIRCLE) {
      data.addAll({"replyCircleId": replyCircleId.toString()});
    }
    if (pollOptions != null) {
      data.addAll({"pollOptions": jsonEncode(pollOptions)});
    }
    if (pollDurationHours != null) {
      data.addAll({"pollDurationHours": pollDurationHours.toString()});
    }
    if (scheduledFor != null) {
      data.addAll({"scheduledFor": scheduledFor.toIso8601String()});
    }
    if (parentId != null) data.addAll({"parentId": parentId.toString()});
    if (quotedPostId != null) {
      data.addAll({"quotedPostId": quotedPostId.toString()});
    }

    request.fields.addAll(data);

    if (medias != null) {
      for (var media in medias) {
        request.files.add(
          httpx.MultipartFile.fromBytes(
            "media",
            await media.readAsBytes(),
            filename: media.path.split(Platform.pathSeparator).last,
            contentType: httpx.MediaType.parse(getMimeType(media.path)),
          ),
        );
      }
    }

    final response = await request.send();
    final bodyString = await response.stream.bytesToString();

    debugPrint("req-headers: $headers");
    debugPrint("status: ${response.statusCode}");
    debugPrint("body: $bodyString");

    await afterRequestStreamed(response, bodyString);

    final jsonData = jsonDecode(bodyString) as Map<String, dynamic>;
    return Post.fromJson(jsonData["post"] as Map<String, dynamic>);
  }

  Future<List<Circle>> getUserCircles() async {
    final jsonData = await get("social/circles");
    return (jsonData["circles"] as List<dynamic>)
        .map((e) => Circle.fromJson(e as Map<String, Object?>))
        .toList();
  }

  Future<UserResponse> getUserByUsername(String username) async {
    final jsonData = await get("users/$username");
    return UserResponse.fromJson(jsonData);
  }

  Future<void> follow(int userId) async {
    final _ = await post("follow/$userId");
  }

  Future<void> unfollow(int userId) async {
    final _ = await delete("follow/$userId");
  }

  Future<int> getUnreadNotificationCount() async {
    final jsonData = await get("notifications/unread/count");
    return jsonData["count"] as int;
  }

  Future<void> markUnReadNotificationsAsRead() async {
    final _ = await patch("notifications/read-all");
  }

  Future<NotificationResponse> getNotifications({
    required int page,
    required int limit,
  }) async {
    final jsonData = await get("notifications?page=$page&limit=$limit");
    return NotificationResponse.fromJson(jsonData);
  }

  Future<List<NotificationPost>> getGroupedPosts(
    List<int> notificationIds,
  ) async {
    final jsonData = await get(
      "notifications/grouped-posts?notificationIds=${notificationIds.join(",")}",
    );
    return (jsonData["posts"] as List<dynamic>)
        .map((e) => NotificationPost.fromJson(e as Map<String, Object?>))
        .toList();
  }

  Future<List<Board>> getBoards() async {
    final jsonData = await get("boards");
    return (jsonData["boards"] as List<dynamic>)
        .map((e) => Board.fromJson(e as Map<String, Object?>))
        .toList();
  }

  Future<List<Thread>> getThreads({required String slug}) async {
    final jsonData = await get("boards/$slug");
    return (jsonData["threads"] as List<dynamic>)
        .map((e) => Thread.fromJson(e as Map<String, Object?>))
        .toList();
  }

  Future<List<ThreadReply>> getThreadReplies({
    required String slug,
    required int threadId,
  }) async {
    final jsonData = await get("boards/$slug/threads/$threadId");
    return (jsonData["replies"] as List<dynamic>)
        .map((e) => ThreadReply.fromJson(e as Map<String, Object?>))
        .toList();
  }

  Future<ThreadReply> replyThread(
    String content, {
    List<File>? medias,
    required String slug,
    required int threadId,
  }) async {
    final request = httpx.MultipartRequest(
      'POST',
      Uri.parse("${baseUrl}boards/$slug/threads/$threadId/replies"),
    );

    final deviceId = await getDeviceIdHeader();

    final login = await loadLoginResponse();
    final cookies = await cookieHeaders();

    final headers = <String, String>{
      ...cookies,
      ...deviceId,
      "Authorization": "Bearer ${login!.accessToken}",
      "x-csrf-token": await fetchCsrfToken(),
      "x-client-type": "unofficial_app",
    };
    request.headers.addAll(headers);

    Map<String, String> data = {"content": content};

    request.fields.addAll(data);

    if (medias != null) {
      for (var media in medias) {
        request.files.add(
          httpx.MultipartFile.fromBytes(
            "media",
            await media.readAsBytes(),
            filename: media.path.split(Platform.pathSeparator).last,
            contentType: httpx.MediaType.parse(getMimeType(media.path)),
          ),
        );
      }
    }

    final response = await request.send();
    final bodyString = await response.stream.bytesToString();

    debugPrint("req-headers: $headers");
    debugPrint("status: ${response.statusCode}");
    debugPrint("body: $bodyString");

    await afterRequestStreamed(response, bodyString);

    final jsonData = jsonDecode(bodyString) as Map<String, dynamic>;
    return ThreadReply.fromJson(jsonData["reply"] as Map<String, dynamic>);
  }
}
