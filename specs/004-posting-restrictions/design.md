# 004 投稿制限の解除導線 — design

## 1. 閲覧者自身の情報をどこに置くか

これが 004 の要になる。帯・クイズ・設定の 3 箇所が同じ `AuthUser` を見て、
クイズ合格やメール登録で**その場で変わる**必要がある (REQ-GATE-001, 020)。

現状は各画面が `initState` で `KarotterApi().session.login()` を呼んでいる
（`LegalNoticeBanner` と `AccountSettings`）。これは secure storage への往復と
97 フィールドのデコードで、しかも読んだ値は画面ごとに孤立していて更新も伝わらない。
帯を足すと 3 箇所目になり、合格しても帯が消えない。

`KarotterSession` は起動時に一度だけ資格情報を読んでいるので、**そこで読んだ
`AuthUser` を保持**し、Riverpod のプロバイダに配る。

```dart
// lib/api/session/session.dart
AuthUser? _user;
AuthUser? get user => _user;      // userId / username と同じ扱い

Future<void> initialize() async {
  final saved = await login();     // 読むのはここ 1 回だけ（既存）
  _user = saved?.user;
  _userId = saved?.user.id;
  _username = saved?.user.username;
}
```

```dart
// lib/providers/auth_user.dart
@riverpod
class AuthUserNotifier extends _$AuthUserNotifier {
  @override
  AuthUser? build() => null;

  /// 起動時に session の控えから入れる（startup.dart）。
  void hydrate(AuthUser? user) => state = user;

  /// 部分更新。手元の控え（secure storage）にも書き戻す (REQ-GATE-020)。
  Future<void> patch(AuthUser Function(AuthUser) change) async { ... }

  /// サーバーから取り直す。ブラウザでの認証後に使う (REQ-GATE-019)。
  Future<void> refresh() async { ... auth.me() ... }
}
```

`patch` は `session.saveLogin()` まで通す。これをやらないと再起動で戻る
（`LegalNoticeBanner` が既に同じことを手書きでやっている）。

> 既存 2 画面の `session.login()` もこのプロバイダに寄せられるが、004 の
> 範囲外なので tasks の後ろに置く。振る舞いは変わらない。

## 2. モデル

`lib/objects/legal_quiz.dart` に新設する。sealed は絡まないので別ファイルでよい。

```dart
/// `{ja, en}` の組。karotator は日本語だけ出す (REQ-GATE-023 の非目標)。
@freezed
abstract class LocalizedText with _$LocalizedText {
  const factory LocalizedText({@Default('') String ja, @Default('') String en})
      = _LocalizedText;
  factory LocalizedText.fromJson(Map<String, Object?> json) => ...;
}

extension LocalizedTextX on LocalizedText {
  /// 今は日本語固定。英語化のときはここだけ直す。
  String get text => ja.isNotEmpty ? ja : en;
}

@freezed
abstract class LegalQuiz with _$LegalQuiz {
  const factory LegalQuiz({
    @Default('') String token,
    @Default([]) List<LegalQuizQuestion> questions,
  }) = _LegalQuiz;
}

@freezed
abstract class LegalQuizQuestion with _$LegalQuizQuestion {
  const factory LegalQuizQuestion({
    required int id,
    @Default(LocalizedText()) LocalizedText prompt,
    @Default(LocalizedText()) LocalizedText document,
    @Default('') String documentPath,
    @Default([]) List<LegalQuizOption> options,
  }) = _LegalQuizQuestion;
}

@freezed
abstract class LegalQuizOption with _$LegalQuizOption {
  const factory LegalQuizOption({
    required int id,
    @Default(LocalizedText()) LocalizedText label,
  }) = _LegalQuizOption;
}
```

採点結果は別の形で返る。設問 ID と選択肢 ID で引ける形に畳んでから使う。

```dart
@freezed
abstract class LegalQuizResult with _$LegalQuizResult {
  const factory LegalQuizResult({
    @Default(false) bool passed,

    /// アカウントに記録されたか。[passed] とは別（未ログインだと立たない）。
    @Default(false) bool legalQuizPassed,

    @Default([]) List<LegalQuizGradedQuestion> questions,
  }) = _LegalQuizResult;
}

extension LegalQuizResultX on LegalQuizResult {
  /// `設問ID:選択肢ID` で解説を引く。Web も同じ畳み方をしている。
  Map<String, LegalQuizGradedOption> get byOption => { ... };
}
```

設問数・選択肢数を数え打ちしない (REQ-GATE-023)。全て `@Default([])`。

メール系の応答も小さく持つ。

```dart
@freezed
abstract class EmailVerificationResult with _$EmailVerificationResult {
  const factory EmailVerificationResult({
    @Default(0) int cooldownSeconds,
    @Default('') String message,
    String? email,
  }) = _EmailVerificationResult;
}
```

## 3. エンドポイント

`AuthApi` に足す。`POST /auth/verify-email` は**実装しない**（REQ-GATE-018 でトークンを
アプリで扱わないと決めたため）。

```dart
Future<LegalQuiz> legalQuiz() async =>
    LegalQuiz.fromJson((await http.get('auth/legal-quiz')).json);

Future<LegalQuizResult> gradeLegalQuiz({
  required String token,
  required Map<int, int> answers,   // 設問 ID -> 選択肢 ID
}) async {
  final res = await http.post('auth/legal-quiz/grade', json: {
    'legalQuizToken': token,
    // JSON のキーは文字列。Web も `{[questionId]: optionId}` を送っている。
    'legalQuizAnswers': answers.map((k, v) => MapEntry('$k', v)),
  });
  return LegalQuizResult.fromJson(res.json);
}

Future<EmailVerificationResult> setEmail(String email) async => ...;      // auth/me/email
Future<EmailVerificationResult> resendVerificationEmail() async => ...;   // auth/me/email/resend
```

429 で返る待ち時間は `Retry-After` から拾う。既存の例外に秒数が載っていなければ
`KarotterApi` の例外側に足す（[§12 未解決](#12-未解決)）。

## 4. 帯 (REQ-GATE-001..005)

`lib/ui/posting_restriction.dart`。`home.dart` で `LegalNoticeBanner` の隣に置く。
2 本並ぶことがあるが、Web も同じ（別々の帯）。

```dart
Widget build(...) {
  final user = ref.watch(authUserProvider);
  if (user == null) return const SizedBox.shrink();            // REQ-GATE-005
  if (user.emailVerified && user.legalQuizPassed) return ...;  // 出さない
  if (_dismissed) return const SizedBox.shrink();              // REQ-GATE-003
  ...
}
```

次にやることを 1 つだけ出す (REQ-GATE-002)。

| 状態 | 文言 | ボタン |
| --- | --- | --- |
| `email == null` | メールアドレスを登録し、規約クイズに1回合格すると投稿できるようになります。 | メールアドレスを登録 → `AccountSettings` |
| `!emailVerified` | メール認証が完了していないため投稿できません。 | 再送（待ち時間中は残り秒数） |
| `!legalQuizPassed` | 規約クイズにまだ合格していないため投稿できません。右のボタンから受けてください（1回だけ）。 | クイズへ → `LegalQuizPage` |

### 閉じた記憶 (REQ-GATE-003, 004)

`Preferences` にユーザーごとに持つ。

```dart
bool getPostingRestrictionDismissed(int userId);
Future<void> setPostingRestrictionDismissed(int userId, bool value);
```

**両方が真になった時点で消す。** これをやらないと、一度閉じた人がメール変更などで
再び制限に掛かったとき何も出なくなる。判定と消去は同じ `build` の中で行い、
「出さない」分岐に入ったら消す。

### ブラウザから戻ったとき (REQ-GATE-019)

帯が `AppLifecycleListener` を持ち、`resumed` で `authUserProvider.refresh()` を呼ぶ。
認証リンクを踏んで戻ってくると帯が消える。帯は制限中しか居ないので、
常時ポーリングにはならない。

## 5. クイズ画面 (REQ-GATE-007..014)

`lib/pages/legal_quiz.dart`。状態は 3 つだけ。

```
読み込み中 → 回答中 → 採点済み
                ↑         │
                └─────────┘  「別の問題に挑戦」で引き直す (REQ-GATE-012)
```

- 回答は `Map<int, int>`（設問 ID → 選択肢 ID）。
- 採点ボタンは `answers.length == questions.length` のときだけ押せる (REQ-GATE-008)。
- 採点後は選択肢を操作不可にし、**全ての選択肢**に解説を出す (REQ-GATE-009)。
  色は 正解 / 自分が選んだ / それ以外 の 3 通り。
- 各設問の下に `document` を出し、押すと `documentPath` に対応する規約本文へ飛ばす
  (REQ-GATE-013)。`documentPath` は `/terms` のような Web のパス。
  `legal_documents.dart`（`tool/fetch_legal_documents.dart` 生成）に
  `documentId` があるので、パス → `documentId` の対応表をそこに持たせる。
  対応が無ければリンクを出さない（落とさない）。
- 未成年向けの注意書きとひらがな併記を常に出す (REQ-GATE-014)。

### 合格したとき (REQ-GATE-010, 011)

```dart
if (result.passed && result.legalQuizPassed) {
  await ref.read(authUserProvider.notifier).patch((u) => u.copyWith(legalQuizPassed: true));
}
```

文言は Web の 3 分岐をそのまま写す。**`passed` と `legalQuizPassed` を混同しない。**

| 条件 | 文言 |
| --- | --- |
| 記録済み かつ `emailVerified` | 合格です。投稿制限が解除されました。 |
| 記録済み だが未認証 | 合格です。アカウントへの記録後、メール認証も完了すると投稿制限が解除されます。 |
| 記録されなかった | 合格です。別の問題にも何回でも挑戦できます。 |

## 6. メール (REQ-GATE-015..017)

`AccountSettings` に節を足す。今あるのはパスワード変更だけ。

- 現在のアドレスと認証状態を出す（`email` / `emailVerified`）。
- 登録・変更の入力欄 → `auth.setEmail()`。成功したら `authUserProvider.refresh()`。
- 未認証なら「確認メールを再送」→ `auth.resendVerificationEmail()`。

待ち時間 (REQ-GATE-017) は帯と設定の両方で要る。カウントダウンは共有の小さな
ウィジェットに閉じ込める。

```dart
/// 残り秒数を毎秒減らし、0 になったら onFinished を呼ぶ。
class CooldownButton extends StatefulWidget { ... }
```

秒数の出どころは応答の `cooldownSeconds`。429 のときは `Retry-After`。

## 7. 通知の遷移先 (REQ-GATE-006)

`Notification` に `route` が無い。Web は**まず `route` を見て**、無ければ本文の
前方一致に落としている。同じ順にする（サーバーが文言を変えても `route` があれば効く）。

```dart
// lib/objects/notification.dart
String? route,   // 追加
```

```dart
// lib/objects/notification_target.dart
enum SystemNotificationTarget { legalQuiz, accountSettings }

SystemNotificationTarget? systemNotificationTarget(Notification n) {
  // `//` で始まるものは外部 URL になりうるので弾く（Web と同じガード）。
  final route = n.route;
  if (route != null && route.startsWith('/') && !route.startsWith('//')) {
    if (route.startsWith('/legal-quiz')) return SystemNotificationTarget.legalQuiz;
    if (route.startsWith('/settings')) return SystemNotificationTarget.accountSettings;
    return null;
  }
  if (n.type != NotificationType.SYSTEM) return null;
  final message = n.message ?? '';
  if (message.startsWith('規約クイズにまだ合格していないため投稿できません')) {
    return SystemNotificationTarget.legalQuiz;
  }
  if (message.startsWith('まだメール認証が完了していないため投稿できません')) {
    return SystemNotificationTarget.accountSettings;
  }
  return null;
}
```

karotator は名前付きルートを持たない（`todo.md` に `MaterialPageRoute` 直書き 43 箇所と
ある）。パス文字列をそのまま扱う仕組みは作らず、**004 で要る 2 つだけを列挙**に落とす。
汎用のルート表は 004 の範囲外。

## 8. 投稿は塞がない (REQ-GATE-021)

`PostPage` にも FAB にも判定を入れない。Web も入れていない。
弾かれたときはサーバーのエラーがそのまま出て、SYSTEM 通知が届く。

## 9. 影響範囲

| ファイル | 変更 |
| --- | --- |
| `lib/api/session/session.dart` | `AuthUser` を保持して公開 |
| `lib/providers/auth_user.dart` | **新規** |
| `lib/objects/legal_quiz.dart` | **新規**。`LocalizedText` / `LegalQuiz` / `LegalQuizResult` |
| `lib/objects/notification.dart` | `route` を追加 |
| `lib/objects/notification_target.dart` | **新規**。遷移先の判定 |
| `lib/objects/legal_documents.dart` | パス → `documentId` の対応（生成側 `tool/fetch_legal_documents.dart` を直す） |
| `lib/api/endpoints/auth.dart` | クイズ 2 本、メール 2 本 |
| `lib/ui/posting_restriction.dart` | **新規**。帯 |
| `lib/ui/cooldown_button.dart` | **新規**。待ち時間つきボタン |
| `lib/pages/legal_quiz.dart` | **新規**。クイズ画面 |
| `lib/pages/settings/account.dart` | メールの節を追加 |
| `lib/pages/home.dart` | 帯を置く |
| `lib/pages/startup.dart` | `authUserProvider` を hydrate |
| `lib/pages/home/notification.dart` | SYSTEM 通知の遷移先分岐 |
| `lib/preferences.dart` | 閉じた記憶 |

## 10. 移行の順序

1. `session` に `AuthUser` を保持 → `authUserProvider` → `startup.dart` で hydrate
2. `preferences.dart` に閉じた記憶
3. 帯（メール未登録 / 未認証 / クイズ未合格の 3 状態）— **ここで「投稿できない理由が分かる」までは到達する**
4. `legal_quiz.dart` のモデルと `AuthApi` の 2 本
5. クイズ画面
6. メールの節と `CooldownButton`
7. `Notification.route` と遷移先分岐
8. 既存 2 画面（`LegalNoticeBanner` / `AccountSettings`）の `session.login()` をプロバイダへ寄せる

3 まででユーザーは理由を知れる。5 まででアプリだけで制限を解除できる。

## 11. 試験

判定は widget を通さずに確かめられる形にしておく。

- 帯の 3 状態が `email` / `emailVerified` / `legalQuizPassed` の組で正しく決まる
- 両方が真のとき、閉じた記憶が消える
- `LegalQuiz.fromJson` が設問 0 件でも落ちない (REQ-GATE-023)
- `LegalQuizResult` の `byOption` が設問 ID と選択肢 ID で正しく引ける
- `passed` が真で `legalQuizPassed` が偽のとき、手元の控えを更新しない
- `systemNotificationTarget` が `route` 優先で、無ければ前方一致に落ちる
- `route` が `//evil.example` のとき null を返す

## 12. 未解決

| 項目 | 内容 |
| --- | --- |
| `Retry-After` | 429 の待ち時間を既存の例外が持っているか未確認。無ければ `KarotterHttpException` に足す |
| `documentPath` の対応 | `/terms` などが `legalDocuments` の `documentId` とどう対応するか未確認。実データで突き合わせる |
| `passed` と `legalQuizPassed` の差 | 未ログイン以外にも分かれる条件があるか未確認 |
| メール変更後の `emailVerified` | 偽に戻るのか未確認。戻らないなら帯の状態遷移を見直す |
