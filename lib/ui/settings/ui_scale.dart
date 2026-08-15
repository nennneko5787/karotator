import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karotator/providers/ui_scale.dart';

/// 画面全体の拡大率を選ぶ。
///
/// 小さくしすぎて操作できなくなると設定に戻れないので、下限と上限を決めて
/// おく。刻みも粗くして事故を減らす。
class UiScaleBottomSheet extends ConsumerWidget {
  const UiScaleBottomSheet({super.key});

  static const double min = 0.7;
  static const double max = 1.5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scale = ref.watch(uiScaleProvider);
    final notifier = ref.watch(uiScaleProvider.notifier);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${(scale * 100).round()}%", style: TextStyle(fontSize: 36)),
            Slider(
              value: scale.clamp(min, max),
              min: min,
              max: max,
              // 0.05 刻み。細かすぎると狙った値に止められない。
              divisions: ((max - min) / 0.05).round(),
              label: "${(scale * 100).round()}%",
              onChanged: notifier.setUiScale,
            ),
            const SizedBox(height: 8),
            Text(
              "文字だけでなく、アバターやアイコン、余白もまとめて変わります。",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            TextButton(
              onPressed: () => notifier.setUiScale(1.0),
              child: const Text("100% に戻す"),
            ),
          ],
        ),
      ),
    );
  }
}
