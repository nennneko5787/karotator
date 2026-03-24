import 'dart:convert';
import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as httpx;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  String? nowAccountId;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    nowAccountId = prefs.getString("nowAccountId");
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

    if (nowAccountId == null) return;

    final setCookie = response.headers['set-cookie'];
    if (setCookie == null) return;

    final existing = parseCookies(
      await storage.read(key: "${nowAccountId}_cookies") ?? '',
    );
    existing.addAll(parseCookies(setCookie));
    await storage.write(
      key: "${nowAccountId}_cookies",
      value: existing.entries.map((e) => '${e.key}=${e.value}').join('; '),
    );
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

  Future<LoginResponse?> loadLoginResponse() async {
    if (nowAccountId == null) return null;
    final jsonStr = await storage.read(key: "${nowAccountId}_login");
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

  Future<Map<String, Object?>> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    final cookies = await cookieHeaders();
    final deviceId = await getDeviceIdHeader();

    final response = await http.get(
      Uri.parse("https://karotter.com/api/$url"),
      headers: {
        ...cookies,
        ...deviceId,
        ...?headers,
        "x-client-type": "unofficial_app",
      },
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
  }) async {
    final cookies = await cookieHeaders();
    final deviceId = await getDeviceIdHeader();

    final response = await http.post(
      Uri.parse("https://karotter.com/api/$url"),
      headers: {
        ...cookies,
        ...deviceId,
        ...?headers,
        "x-client-type": "unofficial_app",
      },
      body: body,
    );
    debugPrint("status: ${response.statusCode}");
    debugPrint("body: ${utf8.decode(response.bodyBytes)}");
    await afterRequest(response);
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, Object?>;
  }

  Future<RecommendedResponse> getRecommended({
    required int page,
    required int limit,
  }) async {
    final jsonData = await get("posts/recommended?page=$page&limit=$limit");
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
      await saveLoginResponse(response);
      return response;
    } catch (e) {
      await removeAccountId(id);
      rethrow;
    }
  }
}
