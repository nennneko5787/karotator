// アプリのルートが組み立てられることだけを見る煙感知器。
//
// StartUpPage は起動時に SharedPreferences や安全なストレージを触るので、
// ここでは最初の 1 フレームまでしか進めない。通信や画面遷移は対象外。

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:karotator/main.dart';

void main() {
  testWidgets('ルートウィジェットが例外なく組み立つ', (WidgetTester tester) async {
    // main() と同じく ProviderScope で包む。これが無いと
    // 「No ProviderScope found」で落ちる。
    await tester.pumpWidget(const ProviderScope(child: Karotator()));

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
