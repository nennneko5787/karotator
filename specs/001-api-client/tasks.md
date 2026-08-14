# 001 API クライアント刷新 — tasks

## フェーズ 1: 仕様の自動取得

- [x] **T-01** `tool/fetch_api_spec.dart` を実装する — REQ-API-027..029
- [x] **T-02** 実行して `specs/api/endpoints.json` / `endpoints.md` を生成する
- [x] **T-03** 解析結果を `specs/api/conventions.md` にまとめる

## フェーズ 2: 土台

- [x] **T-04** `lib/api/exceptions.dart` — 例外階層。`lib/exceptions.dart` を置換 — REQ-API-016
- [x] **T-05** `lib/api/session.dart` — `KarotterSession` — REQ-API-001, 011, 022..024
- [x] **T-06** `lib/api/client.dart` — 単一 `send` + ヘッダ組み立て — REQ-API-002, 005..009
- [x] **T-07** 応答処理（Set-Cookie マージ / CSRF 回収 / ステータス分岐）— REQ-API-010, 011, 014..016
- [x] **T-08** 401 / 403(CSRF) の 1 回再送 — REQ-API-012, 013
- [x] **T-09** リフレッシュ（直列化 / クールダウン / 409 / 403）— REQ-API-017..021

## フェーズ 3: エンドポイント

- [x] **T-10** `endpoints/endpoints.dart` 基底 — REQ-API-003
- [x] **T-11** `auth.dart`
- [x] **T-12** `posts.dart`
- [x] **T-13** `users.dart`（`follow` 系を含む）
- [x] **T-14** `social.dart`
- [x] **T-15** `boards.dart`
- [x] **T-16** `notifications.dart`
- [x] **T-17** `dm.dart`
- [x] **T-18** `search.dart`
- [x] **T-19** `karotter_api.dart` 入口 — REQ-API-004

## フェーズ 4: 移行

- [x] **T-20** 呼び出し箇所 76 ヶ所を `KarotterApi` へ置換 — REQ-API-025
- [x] **T-21** `lib/http.dart` / `lib/exceptions.dart` を削除
- [x] **T-22** `flutter analyze` を通す
- [ ] **T-23** 実機で疎通確認（ログイン → タイムライン → 投稿 → 通知）

## フェーズ 5: テスト

- [ ] **T-24** `test/api/client_test.dart` — ヘッダ / CSRF / 再送 / 例外
- [ ] **T-25** `test/api/session_test.dart` — Cookie マージ / アカウント切替
- [ ] **T-26** `test/api/refresh_test.dart` — 409 / 403 / クールダウン / 直列化

## 補足

- T-23 は実際の Karotter アカウントが要るため手動。特に **`auth/refresh-token` への変更**と
  **`x-active-account-id` の追加**は解析ベースの推測であり、実機確認まで確定ではない。
- T-24..26 は `todo.md` の「テストを書く」に対応する。`http` の `MockClient` を使い、ネットワークには出ない。
