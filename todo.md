# ToDo / 実装してない機能まとめ

READMEに書くと長ったらしくなるのでファイルを分けることにしました  
実装されたら消されます

## アプリ全体

- [ ] テストを書く
  - [x] モデルのパース（未知の列挙値・欠けたフィールド）— `test/objects/parsing_test.dart`
  - [x] 楽観更新のロールバック — `test/providers/post_notifier_test.dart`
  - [ ] APIクライアント（再送・CSRF・リフレッシュ）
  - [ ] ~~https://pub.dev/packages/media_kit#permissions をやる~~
- [ ] iOS用のPodfileを作る

## UI

- [x] `lib/factory/post.dart` の Widget を返す関数 8 個をウィジェット化し、
      `lib/ui/post/{avatar,header,content,media,actions}.dart` に分割
- [x] `lib/pages/post.dart` の分割（683 → 433 行、`build()` 340 → 40 行）
- [x] `https://karotter.com` のハードコード 21 箇所を `const.dart` に集約
- [x] プロバイダを `postsApiProvider` / `usersApiProvider` 越しにして差し替え可能に
- [ ] 未ログイン → `LoginPage` の分岐がまだ 7 箇所に散っている
      （`PostActionsWidget` 内は `_requireSignIn` にまとめた）
- [ ] `MaterialPageRoute` の直書き 43 箇所。名前付きルートか遷移ヘルパーへ
- [ ] `lib/pages/profile.dart` (433 行) と `lib/pages/home/notification.dart` (394 行)
- [x] `lib/pages/login.dart` の利用規約 / プライバシーのリンクを復活
      （アプリ内で本文を表示する）

## 規約・ポリシー

一覧は `dart run tool/fetch_legal_documents.dart` で再生成する。
仕様は [specs/api/legal-documents.md](specs/api/legal-documents.md)。

- [x] `GET /legal/{id}?locale=ja`（text/plain・認証不要）から本文を表示
- [x] 設定 → 規約・ポリシー に 12 文書の目次
- [x] ログイン画面のリンクをアプリ内表示に
- [x] `GET /legal/summary` の `version` と `AuthUser.legalNoticeSeenVersion` を
      比べて「規約・ポリシーが更新されました」の帯をホームに出す。
      「確認した」で `PATCH users/settings` と手元の控えの両方を更新する
- [x] 年齢制限・制裁措置ガイドラインは Karotter が API で配っていないので、
      Web のバンドルに埋まっている本文を写して同梱する。
      表示時は「同梱した内容です」と断り、最新版はブラウザへ誘導する
- [ ] 英語表示（`locale=en` も取れる。`titleEn` / `descriptionEn` も生成済み）

## 新規登録

- [ ] `POST /auth/register` は `turnstileToken` を要求する。
      **Turnstile を迂回する実装はしない。** 取りうる手は
      Karotter の登録ページ（`/register`）を開いて本人に解いてもらうか、
      Karotter 側にアプリ用の導線を用意してもらうかのどちらか

## ホーム

- [ ] 検索
- [x] 通知
- [ ] DM

## タイムライン

- [ ] 自動更新(socket.io)

## HTTP

仕様は [specs/001-api-client](specs/001-api-client/requirements.md) にまとめてある。
エンドポイント一覧は `dart run tool/fetch_api_spec.dart` で再生成できる。

- [x] PATCHの実装
- [x] アプリ内のセッションとHTTPのクラスを分ける
- [x] おおまかなカテゴリごとにファイルを分離
- [ ] APIクライアントのテストを書く (specs/001-api-client/tasks.md の T-24..26)
- [ ] 実機で疎通確認 — `auth/refresh-token` と `x-active-account-id` は解析ベースの推測

## カロート

- [x] ウィジェット化
- [x] 投票
- [x]カロート詳細ページでのかんたんなリプライ
- [ ] 返信でのメンション除外設定
- [ ] 削除
- [ ] ピン留め
- [ ] 通報
- [ ] 会話から抜ける
- [ ] 上にスクロールしてスレッドをさらに表示

## カロートの投稿

- [x] 予約投稿
- [x] 公開範囲の設定
- [x] 返信可能範囲の設定
- [x] コンテンツ開示設定

## その他

- [x] プロフィール
- [ ] サークル・リストの作成
- [ ] リストタイムライン(サークルはあるのかすら知らん)
- [ ] 絵チャ
- [ ] スペース(復活したら)
- [ ] ブックマークページ
- [ ] プロフ編集
- [ ] アカウント設定
- [ ] アプリ設定
