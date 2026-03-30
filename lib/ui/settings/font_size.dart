import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karotator/providers/font_size.dart';

class FontSizeBottomSheet extends ConsumerWidget {
  const FontSizeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontSize = ref.watch(fontSizeProvider);
    final notifier = ref.watch(fontSizeProvider.notifier);

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.noScaling),
            child: Text(
              "${(fontSize * 100).floor()}%",
              style: TextStyle(fontSize: 36),
            ),
          ),
          Slider(
            value: fontSize,
            max: 2.0,
            min: 0,
            onChanged: (value) {
              notifier.setFontSize(value);
            },
          ),
        ],
      ),
    );
  }
}
