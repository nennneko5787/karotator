/// Karotter API が返したエラー。
///
/// 仕様: specs/api/conventions.md §5 / REQ-API-016
abstract class KarotterException implements Exception {
  const KarotterException(
    this.statusCode,
    this.message, {
    this.code,
    this.body,
  });

  /// HTTP ステータスコード。
  final int statusCode;

  /// 人間向けのメッセージ。サーバーの `error` フィールド、無ければ生のボディ。
  final String? message;

  /// サーバーの `code` フィールド。`ACCOUNT_BANNED` など。
  final String? code;

  /// パース済みのレスポンスボディ。JSON でなければ null。
  final Map<String, Object?>? body;

  @override
  String toString() =>
      '$runtimeType{statusCode: $statusCode, code: $code, message: $message}';
}

/// 4xx。呼び出し側の要求に問題がある。
class KarotterClientException extends KarotterException {
  const KarotterClientException(
    super.statusCode,
    super.message, {
    super.code,
    super.body,
  });
}

/// 5xx。Karotter 側で問題が起きている。
class KarotterServerException extends KarotterException {
  const KarotterServerException(
    super.statusCode,
    super.message, {
    super.code,
    super.body,
  });
}

/// 403 + `code: ACCOUNT_BANNED`。アカウントが凍結されている。
///
/// この例外が飛んだ時点でトークンは破棄済み。再ログインさせること。
class KarotterBannedException extends KarotterClientException {
  const KarotterBannedException(
    super.statusCode,
    super.message, {
    super.code,
    super.body,
    this.bannedUntil,
    this.banReason,
  });

  /// 凍結解除日時。無期限なら null。
  final String? bannedUntil;

  /// 凍結理由。
  final String? banReason;
}

/// 403 + `code: BIRTHDAY_REQUIRED`。生年月日の入力が要る。
class KarotterBirthdayRequiredException extends KarotterClientException {
  const KarotterBirthdayRequiredException(
    super.statusCode,
    super.message, {
    super.code,
    super.body,
  });
}

/// トークンのリフレッシュに失敗した。再ログインが要る。
class KarotterRefreshFailedException implements Exception {
  const KarotterRefreshFailedException(this.reason);

  final String reason;

  @override
  String toString() => 'KarotterRefreshFailedException{reason: $reason}';
}
