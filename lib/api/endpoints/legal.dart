import 'package:karotator/api/endpoints/endpoints.dart';
import 'package:karotator/objects/legal.dart';

/// `/legal` — 規約・ポリシー。
///
/// 認証は要らない。ログイン前の画面からも呼べる。
/// 一覧を返すエンドポイントは無いので、どんな文書があるかは
/// `legalDocuments`（`tool/fetch_legal_documents.dart` が生成）を見る。
class LegalApi extends KarotterEndpoints {
  const LegalApi(super.http);

  /// 規約の更新状況。
  ///
  /// [LegalSummary.version] が `AuthUser.legalNoticeSeenVersion` と違えば、
  /// 前回確認したときから規約が変わっている。
  Future<LegalSummary> summary() async {
    final res = await http.get('legal/summary');
    return LegalSummary.fromJson(res.json);
  }

  /// 本文を取る。応答は JSON ではなく text/plain。
  Future<LegalDocument> document(String id, {String locale = 'ja'}) async {
    final res = await http.get(
      'legal/${Uri.encodeComponent(id)}',
      query: {'locale': locale},
    );
    return LegalDocument.parse(id, res.text);
  }
}
