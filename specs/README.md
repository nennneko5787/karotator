# specs — 仕様駆動開発

karotator は Karotter の**非公式**クライアントであり、参照できる公式 API ドキュメントが存在しない。
そのため「実装を読んで仕様を推測する」作業が常に発生する。ここではその推測結果を**仕様として明文化**し、
コードより先に仕様を書く運用を取る。

## ディレクトリ構成

| パス | 中身 | 更新者 |
| --- | --- | --- |
| `specs/api/` | Karotter Web クライアント (`https://karotter.com`) から観測した **API そのものの仕様** | 一部自動生成 |
| `specs/<連番>-<機能名>/` | karotator 側で**どう作るか**の仕様（機能単位） | 手書き |

`specs/api/` は「相手（Karotter）の仕様」、`specs/NNN-*/` は「こちらの仕様」という切り分け。

## 機能仕様の 3 点セット

機能ディレクトリには次の 3 ファイルを置く。

1. **`requirements.md`** — 何を満たせば完成か。EARS 記法で書く。実装手段は書かない。
2. **`design.md`** — どう作るか。構成・クラス・データフロー・移行方針。
3. **`tasks.md`** — 実装の手順。requirements の項番に紐付ける。

### EARS 記法

要件は次のいずれかの形に落とす。曖昧な「〜できるようにする」は書かない。

| 種別 | 型 |
| --- | --- |
| Ubiquitous | システムは `<応答>` すること |
| Event-driven | `<トリガ>` したとき、システムは `<応答>` すること |
| State-driven | `<状態>` の間、システムは `<応答>` すること |
| Unwanted | もし `<条件>` ならば、システムは `<応答>` すること |
| Optional | `<機能>` が有効な場合、システムは `<応答>` すること |

各要件には `REQ-<機能略号>-<連番>` の ID を振り、design / tasks / コードのコメントから参照する。

## 進め方

```
requirements.md を書く → 合意 → design.md を書く → 合意 → tasks.md → 実装 → 仕様を更新
```

仕様と実装がずれた場合、**実装ではなく仕様を先に直す**。仕様に書いていない挙動は「まだ決まっていない」とみなす。

## 一覧

| ID | 機能 | 状態 |
| --- | --- | --- |
| [001](001-api-client/requirements.md) | API クライアント刷新 | 実装済み（疎通確認とテストが残り） |
| [002](002-response-models/requirements.md) | レスポンスモデルの整合 | 実装中（実データでの確認が残り） |

## `specs/api/` の中身

| ファイル | 出どころ | 再生成 |
| --- | --- | --- |
| `conventions.md` | 手書き（バンドル解析の結果をまとめたもの） | — |
| `endpoints.md` / `.json` | 内部 API の**観測**結果 297 件 | `dart run tool/fetch_api_spec.dart` |
| `developer-api.md` | Karotter 公式の開発者 API ドキュメント 85 件 | `dart run tool/fetch_api_docs.dart` |
| `schemas/*.json` | 公式のレスポンス例（Post / User / Poll / TimelineItem） | 同上 |
| `observed-schemas.md` / `.json` | 実レスポンスから起こした型 | `dart run tool/capture_api_samples.dart` |
| `legal-documents.md` | 規約・ポリシー 12 件の一覧と `documentId` | `dart run tool/fetch_legal_documents.dart` |

`fetch_legal_documents.dart` は `lib/objects/legal_documents.dart` も生成する。
一覧を返す API が無く、どんな文書があるかは Karotter Web の JS にしか無いため。

自動生成のファイルは手で編集しない。直したくなったら生成側を直す。
