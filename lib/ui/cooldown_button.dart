import "dart:async";

import "package:flutter/material.dart";

/// 押したあと一定時間押せなくなるボタン。
///
/// 確認メールの再送はサーバーが `cooldownSeconds` を返すので、その間は
/// 残り秒数を出して押せなくする (REQ-GATE-017)。帯と設定画面が共有する。
class CooldownButton extends StatefulWidget {
  const CooldownButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style,
  });

  final String label;

  /// 押されたときに走らせる処理。戻り値が待ち時間の秒数。
  /// 0 以下なら待たせない。
  final Future<int> Function() onPressed;

  final ButtonStyle? style;

  @override
  State<CooldownButton> createState() => _CooldownButtonState();
}

class _CooldownButtonState extends State<CooldownButton> {
  Timer? _timer;
  int _remaining = 0;
  bool _running = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCooldown(int seconds) {
    _timer?.cancel();
    if (seconds <= 0) {
      setState(() => _remaining = 0);
      return;
    }

    setState(() => _remaining = seconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() => _remaining--);
      if (_remaining <= 0) timer.cancel();
    });
  }

  Future<void> _press() async {
    if (_running || _remaining > 0) return;
    setState(() => _running = true);
    try {
      _startCooldown(await widget.onPressed());
    } finally {
      if (mounted) setState(() => _running = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final waiting = _remaining > 0;

    return FilledButton(
      onPressed: (_running || waiting) ? null : _press,
      style: widget.style,
      child: Text(
        _running
            ? "送信中..."
            : waiting
            ? "$_remaining 秒後に再送できます"
            : widget.label,
      ),
    );
  }
}
