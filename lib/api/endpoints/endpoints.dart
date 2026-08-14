import 'package:karotator/api/client.dart';

/// エンドポイント群の基底 (REQ-API-003)。
///
/// Karotter の第 1 パスセグメントごとに 1 つ作る。持っているのは
/// [KarotterHttpClient] への参照だけで、送信のことは知らない。
abstract class KarotterEndpoints {
  const KarotterEndpoints(this.http);

  final KarotterHttpClient http;
}
