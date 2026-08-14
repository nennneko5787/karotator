import "package:flutter/material.dart";

/// カロートに付けるコンテンツ開示の設定。
///
/// 4 つの真偽値が常に一緒に動くのでまとめてある。そのまま
/// `KarotterApi().posts.create(...)` に渡せる。
class ContentDisclosure {
  const ContentDisclosure({
    this.isAiGenerated = false,
    this.isPromotional = false,
    this.isR18 = false,
    this.hideFromMinors = false,
  });

  final bool isAiGenerated;
  final bool isPromotional;
  final bool isR18;
  final bool hideFromMinors;

  /// 1 つでも立っていれば、投稿ボタンの横に印を出す判断に使う。
  bool get hasAny =>
      isAiGenerated || isPromotional || isR18 || hideFromMinors;

  ContentDisclosure copyWith({
    bool? isAiGenerated,
    bool? isPromotional,
    bool? isR18,
    bool? hideFromMinors,
  }) => ContentDisclosure(
    isAiGenerated: isAiGenerated ?? this.isAiGenerated,
    isPromotional: isPromotional ?? this.isPromotional,
    isR18: isR18 ?? this.isR18,
    hideFromMinors: hideFromMinors ?? this.hideFromMinors,
  );
}

/// コンテンツ開示の設定を編集する。閉じられたら null。
Future<ContentDisclosure?> showContentDisclosureDialog(
  BuildContext context,
  ContentDisclosure current,
) {
  return showDialog<ContentDisclosure>(
    context: context,
    builder: (context) => _ContentDisclosureDialog(initial: current),
  );
}

class _ContentDisclosureDialog extends StatefulWidget {
  const _ContentDisclosureDialog({required this.initial});

  final ContentDisclosure initial;

  @override
  State<_ContentDisclosureDialog> createState() =>
      _ContentDisclosureDialogState();
}

class _ContentDisclosureDialogState extends State<_ContentDisclosureDialog> {
  late ContentDisclosure _value = widget.initial;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("コンテンツ開示の設定"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Toggle(
            label: "このカロートはAIで作成した内容を含む",
            value: _value.isAiGenerated,
            onChanged: (v) =>
                setState(() => _value = _value.copyWith(isAiGenerated: v)),
          ),
          _Toggle(
            label: "このカロートはブランドまたはビジネスの宣伝である",
            value: _value.isPromotional,
            onChanged: (v) =>
                setState(() => _value = _value.copyWith(isPromotional: v)),
          ),
          _Toggle(
            label: "投稿全体をR18として扱う",
            value: _value.isR18,
            onChanged: (v) =>
                setState(() => _value = _value.copyWith(isR18: v)),
          ),
          _Toggle(
            label: "未成年ユーザーにはこの投稿を表示しない",
            value: _value.hideFromMinors,
            onChanged: (v) =>
                setState(() => _value = _value.copyWith(hideFromMinors: v)),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("キャンセル"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _value),
          child: const Text("OK"),
        ),
      ],
    );
  }
}

class _Toggle extends StatelessWidget {
  const _Toggle({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(value: value, onChanged: (v) => onChanged(v ?? false)),
        Expanded(child: Text(label)),
      ],
    );
  }
}
