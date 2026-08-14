import 'package:karotator/api/session/accounts.dart';
import 'package:karotator/api/session/cookies.dart';
import 'package:karotator/api/session/credentials.dart';
import 'package:karotator/api/session/csrf.dart';
import 'package:karotator/api/session/device.dart';
import 'package:karotator/objects/response.dart';

export 'package:karotator/api/session/accounts.dart';
export 'package:karotator/api/session/cookies.dart';
export 'package:karotator/api/session/credentials.dart';
export 'package:karotator/api/session/csrf.dart';
export 'package:karotator/api/session/device.dart';

/// 「今どのアカウントで動いているか」という文脈 (REQ-API-001)。
///
/// 実際の保存は [AccountStore] / [CredentialStore] / [CookieJar] /
/// [CsrfStore] / [DeviceId] が分担する。ここはそれらにアクティブな
/// アカウント ID を渡すだけ。アカウント切り替えで何が変わるかは、
/// このファイルだけを読めば分かるようにしてある。
class KarotterSession {
  KarotterSession({
    AccountStore? accounts,
    CredentialStore? credentials,
    CookieJar? cookies,
    CsrfStore? csrf,
    DeviceId? device,
  }) : accounts = accounts ?? AccountStore(),
       credentials = credentials ?? CredentialStore(),
       cookies = cookies ?? CookieJar(),
       csrf = csrf ?? CsrfStore(),
       _device = device ?? DeviceId();

  final AccountStore accounts;
  final CredentialStore credentials;
  final CookieJar cookies;
  final CsrfStore csrf;
  final DeviceId _device;

  String? _accountId;
  int? _userId;
  String? _deviceId;
  bool _initialized = false;

  /// アプリ内部のアカウント識別子 (UUID)。未ログインなら null。
  String? get accountId => _accountId;

  /// Karotter の数値ユーザー ID。`x-active-account-id` に載る。
  int? get userId => _userId;

  /// 端末 UUID。[initialize] 後は必ず値がある。
  String get deviceId => _deviceId ?? '';

  bool get initialized => _initialized;

  bool get isSignedIn => _accountId != null;

  /// 起動時に一度だけ呼ぶ。アクティブアカウントとデバイス ID を読み込む。
  Future<void> initialize() async {
    _deviceId = await _device.get();
    _accountId = await accounts.activeId();
    _userId = (await login())?.user.id;
    _initialized = true;
  }

  /// アクティブなアカウントのトークン。未ログインなら null。
  Future<LoginResponse?> login() async {
    final id = _accountId;
    return id == null ? null : credentials.load(id);
  }

  /// 任意のアカウントのトークン。アカウント切り替え UI で使う。
  Future<LoginResponse?> loginOf(String accountId) =>
      credentials.load(accountId);

  Future<void> saveLogin(LoginResponse res) async {
    final id = _accountId;
    if (id == null) return;
    await credentials.save(id, res);
    _userId = res.user.id;
  }

  Future<void> applyRefresh(RefreshResponse res) async {
    final id = _accountId;
    if (id == null) return;
    await credentials.applyRefresh(id, res);
  }

  /// レスポンスの `Set-Cookie` を今のアカウントに取り込む。
  Future<void> mergeSetCookies(Iterable<String> setCookies) async {
    final id = _accountId;
    if (id == null) return;
    await cookies.merge(id, setCookies);
  }

  /// `Cookie` ヘッダの値。
  Future<String?> cookieHeader() async {
    final id = _accountId;
    return id == null ? null : cookies.header(id);
  }

  /// `x-csrf-token` ヘッダの値 (REQ-API-007)。
  Future<String?> csrfHeader() async {
    final id = _accountId;
    final fromCookies = id == null
        ? <String>[]
        : await cookies.valuesOf(id, csrfCookieName);
    return csrf.header(fromCookies);
  }

  /// 新しいアカウント枠を作ってアクティブにする。ログイン前に呼ぶ。
  Future<String> addAccount() async {
    final id = await accounts.create();
    _accountId = id;
    _userId = null;
    csrf.clear();
    return id;
  }

  /// 別のアカウントに切り替える。戻り値は切り替え先のトークン。
  ///
  /// メモリ上の状態は await の前に更新する。呼び出し側が結果を待たずに
  /// 画面遷移することがあり、その間も [accountId] は新しい値を返す必要がある。
  Future<LoginResponse?> switchTo(String accountId) async {
    _accountId = accountId;
    _userId = null;
    csrf.clear();

    await accounts.activate(accountId);
    final res = await credentials.load(accountId);
    _userId = res?.user.id;
    return res;
  }

  /// アカウントを消す。トークンと Cookie も安全なストレージから消す
  /// (REQ-API-023)。消したのがアクティブなら残りの先頭に移る。
  Future<void> removeAccount(String accountId) async {
    final next = await accounts.remove(accountId);
    await credentials.clear(accountId);
    await cookies.clear(accountId);

    if (_accountId != accountId) return;

    _accountId = next;
    csrf.clear();
    _userId = next == null ? null : (await credentials.load(next))?.user.id;
  }

  /// トークンと Cookie を捨てる。アカウント枠自体は残す。
  ///
  /// BAN されたときなど、再ログインさせたい場合に使う。
  Future<void> signOut() async {
    final id = _accountId;
    if (id == null) return;
    await credentials.clear(id);
    await cookies.clear(id);
    csrf.clear();
    _userId = null;
  }
}
