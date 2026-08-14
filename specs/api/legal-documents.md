# 規約・ポリシー一覧

<!-- このファイルは自動生成される。手で編集しない。 -->
<!-- 再生成: dart run tool/fetch_legal_documents.dart -->

出典: `https://karotter.com` のバンドル内 `legalLinks` チャンク。
本文は `GET /legal/{id}?locale=ja` から **text/plain** で取れる（認証不要）。
更新の有無は `GET /legal/summary` の `version` を
`AuthUser.legalNoticeSeenVersion` と比べて判断する。

| 文書 | `documentId` | Web パス | 本文の入手先 |
| --- | --- | --- | --- |
| 利用規約 | `terms` | `/terms` | API |
| プライバシーポリシー | `privacy` | `/privacy` | API |
| Cookieポリシー | `cookie_policy` | `/cookie-policy` | API |
| AI利用・学習ポリシー | `ai_policy` | `/ai-policy` | API |
| 権利侵害対応・削除請求・発信者情報開示関連ポリシー | `enforcement_policy` | `/enforcement-policy` | API |
| 児童安全ポリシー | `child_safety_policy` | `/child-safety-policy` | API |
| API・Bot利用規約 | `api_bot_terms` | `/api-bot-terms` | API |
| 特定商取引法に基づく表記 | `specified_commercial_transactions` | `/specified-commercial-transactions` | API |
| 反復侵害者ポリシー | `repeat_infringer_policy` | `/repeat-infringer-policy` | API |
| 死亡・相続時のアカウント取扱いポリシー | `account_memorial_inheritance_policy` | `/account-memorial-inheritance-policy` | API |
| 事業譲渡等に伴うデータ承継ポリシー | `business_transfer_data_succession_policy` | `/business-transfer-data-succession-policy` | API |
| 年齢制限・制裁措置ガイドライン | `restrictions-guidelines` | `/restrictions-guidelines` | バンドル同梱 |

本文の形式:

```
@effectiveDate: 2026-06-27
@title: 利用規約

前文の段落。空行で区切る。

## 第1条（適用）
本文。
```

