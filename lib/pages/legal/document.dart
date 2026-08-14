import "package:flutter/material.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/const.dart";
import "package:karotator/objects/legal.dart";
import "package:karotator/utils.dart";

/// 規約・ポリシーの本文。
class LegalDocumentPage extends StatefulWidget {
  const LegalDocumentPage({super.key, required this.document});

  final LegalDocumentRef document;

  @override
  State<LegalDocumentPage> createState() => _LegalDocumentPageState();
}

class _LegalDocumentPageState extends State<LegalDocumentPage> {
  late Future<_Loaded> _document = _fetch();

  /// API を試し、駄目なら同梱している本文に落とす。
  Future<_Loaded> _fetch() async {
    final ref = widget.document;

    if (ref.apiAvailable) {
      try {
        final doc = await KarotterApi().legal.document(ref.id);
        return _Loaded(doc, fromBundle: false);
      } catch (e) {
        if (ref.fallbackBody == null) rethrow;
        debugPrint("規約の取得に失敗。同梱分を使う: $e");
      }
    }

    final body = ref.fallbackBody;
    if (body == null) throw StateError("本文がありません");
    return _Loaded(
      LegalDocument.parse(ref.id, body).withTitle(ref.titleJa),
      fromBundle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.document.titleJa),
        actions: [
          IconButton(
            tooltip: "ブラウザで開く",
            icon: const Icon(Icons.open_in_new),
            onPressed: () => openURL(karotterUrl(widget.document.path)),
          ),
        ],
      ),
      body: FutureBuilder<_Loaded>(
        future: _document,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return _Error(
              message: "${snapshot.error}",
              onRetry: () => setState(() => _document = _fetch()),
            );
          }
          final loaded = snapshot.data!;
          return _Body(
            document: loaded.document,
            fromBundle: loaded.fromBundle,
          );
        },
      ),
    );
  }
}

/// 読み込み結果。どこから取れたかで注意書きを変える。
class _Loaded {
  const _Loaded(this.document, {required this.fromBundle});

  final LegalDocument document;

  /// API ではなくアプリ同梱の本文を使ったか。
  final bool fromBundle;
}

class _Body extends StatelessWidget {
  const _Body({required this.document, required this.fromBundle});

  final LegalDocument document;
  final bool fromBundle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SelectionArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          if (fromBundle) const _BundleNotice(),
          if (document.effectiveDate.isNotEmpty)
            Text(
              "施行日: ${document.effectiveDate}",
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.secondaryHeaderColor,
              ),
            ),
          const SizedBox(height: 8),
          Text(document.title, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 16),
          for (final paragraph in document.intro) ...[
            Text(
              paragraph,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.7),
            ),
            const SizedBox(height: 12),
          ],
          for (final section in document.sections) ...[
            const SizedBox(height: 16),
            Text(section.title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            for (final paragraph in section.paragraphs) ...[
              Text(
              paragraph,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.7),
            ),
              const SizedBox(height: 12),
            ],
          ],
        ],
      ),
    );
  }
}

/// 同梱の本文を出しているときの断り書き。
///
/// Karotter がこの文書を API で配っていないので、アプリに写した時点の内容を
/// 出している。最新かどうかは保証できない。
class _BundleNotice extends StatelessWidget {
  const _BundleNotice();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          const Icon(Icons.info_outline, size: 18),
          Expanded(
            child: Text(
              "この文書はKarotterが配信していないため、アプリに同梱した内容を表示しています。"
              "最新版は右上のボタンからブラウザで確認してください。",
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 40),
            const SizedBox(height: 12),
            Text("読み込めませんでした", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            OutlinedButton(onPressed: onRetry, child: const Text("再試行")),
          ],
        ),
      ),
    );
  }
}
