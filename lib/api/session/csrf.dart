/// CSRF トークンを保持する (REQ-API-007, 010)。
///
/// Karotter は CSRF が要るたびに `auth/csrf-token` を叩くことを想定していない。
/// **任意のレスポンスのボディに `csrfToken` があれば、それが最新値**
/// (specs/api/conventions.md §3)。ここはその「最新値」を覚えておく場所。
///
/// 永続化しない。プロセスが死んだら Cookie 側の値と、必要なら
/// `auth/csrf-token` で取り直す。
class CsrfStore {
  String? _latest;

  String? get latest => _latest;

  /// レスポンスから拾った値を覚える。空文字列や null は無視する。
  void remember(String? token) {
    final trimmed = token?.trim();
    if (trimmed == null || trimmed.isEmpty) return;
    _latest = trimmed;
  }

  void clear() => _latest = null;

  /// `x-csrf-token` ヘッダの値を組み立てる。
  ///
  /// メモリ上の最新値と Cookie 由来の値を、重複を除いてカンマで連結する。
  /// 1 つも無ければ null（ヘッダごと付けない）。
  String? header(List<String> cookieValues) {
    final tokens = <String>{?_latest, ...cookieValues}
      ..removeWhere((e) => e.isEmpty);

    return tokens.isEmpty ? null : tokens.join(',');
  }
}
