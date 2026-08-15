import 'package:karotator/api/client.dart';
import 'package:karotator/api/endpoints/endpoints.dart';
import 'package:karotator/api/session/session.dart';
import 'package:karotator/objects/legal_quiz.dart';
import 'package:karotator/objects/response.dart';
import 'package:karotator/objects/user.dart';

/// `/auth` — ログインとセッション。
///
/// specs/api/endpoints.md の `auth` カテゴリ（全 22 件のうち karotator が使う分）。
class AuthApi extends KarotterEndpoints {
  const AuthApi(super.http, this.session);

  final KarotterSession session;

  /// ログインして新しいアカウント枠に保存する。
  ///
  /// 失敗したら作った枠は捨てる。中身の無いアカウントを残さない。
  Future<LoginResponse> login({
    required String identifier,
    required String password,
    required String gender,
  }) async {
    final accountId = await session.addAccount();
    try {
      final res = await http.post(
        'auth/login',
        json: {
          'identifier': identifier,
          'password': password,
          'gender': gender,
          'deviceId': session.deviceId,
          'clientType': clientType,
          'deviceName': deviceName,
        },
      );
      final login = LoginResponse.fromJson(res.json);
      await session.saveLogin(login);
      return login;
    } catch (_) {
      await session.removeAccount(accountId);
      rethrow;
    }
  }

  /// 2 要素認証のコードを送る。[login] が 2FA を要求したときに続けて呼ぶ。
  Future<LoginResponse> loginWith2fa({
    required String token,
    required String code,
  }) async {
    final res = await http.post(
      'auth/login/2fa',
      json: {'token': token, 'code': code},
    );
    final login = LoginResponse.fromJson(res.json);
    await session.saveLogin(login);
    return login;
  }

  /// 現在のセッションの持ち主。
  Future<AuthUser> me() async {
    final res = await http.get('auth/me');
    return res.object('user', AuthUser.fromJson);
  }

  /// アクセストークンを取り直す。
  ///
  /// 通常は 401 を受けた [KarotterHttpClient] が自動で行う (REQ-API-012)。
  /// 明示的に呼ぶ必要はほとんど無い。
  Future<RefreshResponse> refresh() async {
    final res = await http.post(
      'auth/refresh-token',
      json: {
        'deviceId': session.deviceId,
        'clientType': clientType,
        'deviceName': deviceName,
      },
    );
    final refreshed = RefreshResponse.fromJson(res.json);
    await session.applyRefresh(refreshed);
    return refreshed;
  }

  /// 保存済みのセッションで再開する。アカウント切り替え後に呼ぶ。
  Future<RefreshResponse> switchSession() async {
    final login = await session.login();
    if (login == null) {
      throw StateError('切り替え先のアカウントにログイン情報が無い');
    }

    final res = await http.post(
      'auth/switch-session',
      json: {
        'clientType': clientType,
        'deviceName': deviceName,
        'deviceId': login.deviceId,
        'sessionId': login.sessionId,
        'userId': login.user.id,
      },
    );
    final refreshed = RefreshResponse.fromJson(res.json);
    await session.applyRefresh(refreshed);
    return refreshed;
  }

  /// ログアウトする。サーバー側が失敗しても手元の資格情報は必ず捨てる。
  Future<void> logout() async {
    try {
      await http.post('auth/logout');
    } finally {
      await session.signOut();
    }
  }

  /// CSRF トークンを取り直す。
  ///
  /// 通常は不要。レスポンスから自動で回収される (REQ-API-010)。
  Future<String?> csrfToken() => http.fetchCsrfToken();

  /// ログイン中の端末一覧。
  Future<List<Object?>> sessions() async {
    final res = await http.get('auth/sessions');
    return res.json['sessions'] as List<Object?>? ?? const [];
  }

  Future<void> revokeSession(String sessionId) =>
      http.delete('auth/sessions/$sessionId');

  /// 今の端末以外を全てログアウトさせる。
  Future<void> revokeOtherSessions() => http.delete('auth/sessions/others');

  /// 規約理解クイズの問題を取る。
  ///
  /// 呼ぶたびに別の問題が返る。合格するまで何度でも引き直せる
  /// (仕様: specs/004-posting-restrictions)。
  Future<LegalQuiz> legalQuiz() async {
    final res = await http.get('auth/legal-quiz');
    return LegalQuiz.fromJson(res.json);
  }

  /// 回答を採点する。[answers] は 設問 ID → 選択肢 ID。
  ///
  /// 合格しても [LegalQuizResult.legalQuizPassed] が立つとは限らない。
  /// アカウントへ記録されたかどうかはそちらで見る。
  /// 設問 ID も選択肢 ID も**文字列**（`privacy-minors-careful` /
  /// `c15e08d3385c0822`）。数値ではない。
  Future<LegalQuizResult> gradeLegalQuiz({
    required String token,
    required Map<String, String> answers,
  }) async {
    final res = await http.post(
      'auth/legal-quiz/grade',
      json: {'legalQuizToken': token, 'legalQuizAnswers': answers},
    );
    return LegalQuizResult.fromJson(res.json);
  }

  /// メールアドレスを登録・変更する。確認メールが送られる。
  Future<EmailVerificationResult> setEmail(String email) async {
    final res = await http.post('auth/me/email', json: {'email': email});
    return EmailVerificationResult.fromJson(res.json);
  }

  /// 確認メールを再送する。応答の `cooldownSeconds` の間は再送できない。
  Future<EmailVerificationResult> resendVerificationEmail() async {
    final res = await http.post('auth/me/email/resend');
    return EmailVerificationResult.fromJson(res.json);
  }

  // `POST auth/verify-email` は実装しない。確認リンクは端末の既定ブラウザに
  // 開かせ、トークンはアプリで扱わない (REQ-GATE-018)。
}
