import 'dart:convert';

import 'package:http/http.dart' as httpx;
import 'package:karotator/exceptions.dart';
import 'package:karotator/objects/response.dart';

class HTTPClient {
  static final HTTPClient _instance = HTTPClient._internal();
  HTTPClient._internal();

  factory HTTPClient() {
    return _instance;
  }

  final http = httpx.Client();

  void afterRequest(httpx.Response response) {
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
  }

  Future<Map<String, Object?>> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      Uri.parse("https://karotter.com/api/$url"),
      headers: headers,
    );
    afterRequest(response);
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, Object?>;
  }

  Future<Map<String, Object?>> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final response = await http.post(
      Uri.parse("https://karotter.com/api/$url"),
      headers: headers,
      body: body,
    );
    afterRequest(response);
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, Object?>;
  }

  Future<RecommendedResponse> getRecommended({
    required int page,
    required int limit,
  }) async {
    final jsonData = await get("posts/recommended?page=$page&limit=$limit");
    return RecommendedResponse.fromJson(jsonData);
  }
}
