import "package:flutter/material.dart";
import "package:karotator/const.dart";
import "package:karotator/objects/legal.dart";
import "package:karotator/objects/legal_documents.dart";
import "package:karotator/pages/legal/document.dart";
import "package:karotator/utils.dart";

/// 規約・ポリシーの目次。
///
/// 一覧は `legalDocuments`（Karotter Web の JS から生成）。
/// 本文が API に無いものだけ Web を開く。
class LegalPage extends StatelessWidget {
  const LegalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("規約・ポリシー")),
      body: ListView.separated(
        itemCount: legalDocuments.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final doc = legalDocuments[index];
          return ListTile(
            title: Text(doc.titleJa),
            subtitle: Text(doc.descriptionJa),
            trailing: Icon(
              doc.readableInApp ? Icons.chevron_right : Icons.open_in_new,
              size: 20,
            ),
            onTap: () => _open(context, doc),
          );
        },
      ),
    );
  }

  Future<void> _open(BuildContext context, LegalDocumentRef doc) =>
      openLegalDocument(context, doc);
}

/// `documentId` から本文を開く。ログイン画面など、目次を経由しない導線用。
Future<void> openLegalDocumentById(BuildContext context, String id) {
  for (final doc in legalDocuments) {
    if (doc.id == id) return openLegalDocument(context, doc);
  }
  // 一覧が古くて見つからない場合。Web に逃がす。
  return openURL(karotterUrl('/$id')).then((_) {});
}

/// 本文を開く。API に無いものは Web を開く。
Future<void> openLegalDocument(
  BuildContext context,
  LegalDocumentRef doc,
) async {
  if (doc.readableInApp) {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LegalDocumentPage(document: doc)),
    );
    return;
  }

  // API にも同梱分にも本文が無いものは Web に送るしかない。
  final opened = await openURL(karotterUrl(doc.path));
  if (opened || !context.mounted) return;
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(const SnackBar(content: Text("ブラウザを開けませんでした")));
}
