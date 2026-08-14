// 規約本文のパース。
//
// `GET /legal/{id}` は JSON ではなく text/plain を返す。形式は Karotter Web の
// LegalDocumentPage が読んでいるものに合わせてある。
// 仕様: specs/api/legal-documents.md

import 'package:flutter_test/flutter_test.dart';
import 'package:karotator/objects/legal.dart';
import 'package:karotator/objects/legal_documents.dart';

/// 実際の `GET /legal/terms?locale=ja` から抜いた形。
const _raw = '''
@effectiveDate: 2026-06-27
@title: 利用規約

本利用規約は、当団体が運営する本サービスの利用条件を定めるものです。

本サービスには、Webサイト版のほか、アプリ版が含まれます。

## 第1条（適用）

本規約は、ユーザーと当団体との間の一切の関係に適用されます。

当団体が個別に定める規定も本規約の一部を構成します。

## 第2条（禁止事項）

ユーザーは、次の行為をしてはなりません。
''';

void main() {
  group('LegalDocument.parse', () {
    final doc = LegalDocument.parse('terms', _raw);

    test('見出し行を取り出す', () {
      expect(doc.effectiveDate, '2026-06-27');
      expect(doc.title, '利用規約');
    });

    test('前文は空行で段落に分かれる', () {
      expect(doc.intro, hasLength(2));
      expect(doc.intro.first, startsWith('本利用規約は、'));
    });

    test('## で節に分かれる', () {
      expect(doc.sections.map((e) => e.title), [
        '第1条（適用）',
        '第2条（禁止事項）',
      ]);
      expect(doc.sections.first.paragraphs, hasLength(2));
      expect(doc.sections.last.paragraphs, hasLength(1));
    });

    test('前文に見出し行が混ざらない', () {
      for (final paragraph in doc.intro) {
        expect(paragraph, isNot(contains('@title')));
        expect(paragraph, isNot(contains('@effectiveDate')));
      }
    });

    test('CRLF でも読める', () {
      final crlf = LegalDocument.parse('terms', _raw.replaceAll('\n', '\r\n'));
      expect(crlf.title, '利用規約');
      expect(crlf.sections, hasLength(2));
    });

    test('空の本文でも落ちない', () {
      final empty = LegalDocument.parse('terms', '');
      expect(empty.title, isEmpty);
      expect(empty.intro, isEmpty);
      expect(empty.sections, isEmpty);
    });
  });

  group('一覧', () {
    test('生成された一覧に主要な文書が含まれる', () {
      final ids = legalDocuments.map((e) => e.id).toList();
      expect(ids, contains('terms'));
      expect(ids, contains('privacy'));
      expect(ids, contains('cookie_policy'));
    });

    test('API から取れないものには印が付いている', () {
      // restrictions-guidelines は Karotter 側が本文を API で出していない。
      final webOnly = legalDocuments.where((e) => !e.apiAvailable);
      for (final doc in webOnly) {
        expect(doc.path, startsWith('/'), reason: 'Web を開くのに path が要る');
      }
    });

    test('API に無い文書は本文を同梱している', () {
      final embedded = legalDocuments.where((e) => !e.apiAvailable);
      expect(embedded, isNotEmpty, reason: '前提が変わったらこのテストを見直す');

      for (final doc in embedded) {
        expect(
          doc.fallbackBody,
          isNotNull,
          reason: '${doc.id} の本文がアプリ内で読めない',
        );
        expect(doc.readableInApp, isTrue);
      }
    });

    test('同梱した本文が節に分かれて読める', () {
      final doc = legalDocuments.firstWhere((e) => !e.apiAvailable);
      final parsed = LegalDocument.parse(
        doc.id,
        doc.fallbackBody!,
      ).withTitle(doc.titleJa);

      expect(parsed.title, doc.titleJa, reason: '@title が無いので目次の題名で補う');
      expect(parsed.effectiveDate, isNotEmpty);
      expect(parsed.intro, isNotEmpty);
      expect(parsed.sections, isNotEmpty);
    });

    test('全ての文書がアプリ内で読める', () {
      for (final doc in legalDocuments) {
        expect(doc.readableInApp, isTrue, reason: doc.id);
      }
    });
  });
}
