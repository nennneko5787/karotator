import "package:flutter/widgets.dart";
import "package:karotator/objects/circle.dart";

/// 公開範囲・返信可能範囲のシートに並べる選択肢 1 つ。
///
/// もとは `Map<String, Object>` にラベルとアイコンと値を詰めて
/// `item["icon"] as IconData` のように取り出していた。キー名を間違えても
/// コンパイルは通り実行時に落ちるため、型のある形にしてある。
class PostSettingChoice<T> {
  const PostSettingChoice({
    required this.label,
    required this.icon,
    required this.value,
    this.circle,
  });

  final String label;
  final IconData icon;
  final T value;

  /// サークル限定を選んだときの対象。それ以外では null。
  final Circle? circle;
}
