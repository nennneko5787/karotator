import 'package:karotator/api/endpoints/endpoints.dart';
import 'package:karotator/objects/post.dart';
import 'package:karotator/objects/user.dart';

/// `/search` — 検索。
class SearchApi extends KarotterEndpoints {
  const SearchApi(super.http);

  /// ユーザーを探す。
  ///
  /// [compact] を立てるとプロフィール本文などを省いた軽い形で返る。
  /// メンション補完のように候補を出すだけの用途で使う。
  Future<List<Author>> users(
    String query, {
    int limit = 10,
    bool compact = false,
  }) async {
    final res = await http.get(
      'search/users',
      query: {
        'q': query,
        'limit': limit,
        if (compact) 'compact': '1',
      },
    );
    return res.list('users', Author.fromJson);
  }

  /// ハッシュタグを探す。
  Future<List<HashTags>> hashtags(String query) async {
    final res = await http.get('search/hashtags', query: {'q': query});
    return res.list('hashtags', HashTags.fromJson);
  }

  /// コミュニティを探す。karotator はまだコミュニティのモデルを持たない。
  Future<List<Object?>> communities(String query) async {
    final res = await http.get('search/communities', query: {'q': query});
    return res.json['communities'] as List<Object?>? ?? const [];
  }

  /// トレンド。応答のキーは `topics` ではなく `trends`。
  Future<List<Trend>> trendingTopics({int limit = 5}) async {
    final res = await http.get(
      'search/trending/topics',
      query: {'limit': limit},
    );
    return res.list('trends', Trend.fromJson);
  }
}
