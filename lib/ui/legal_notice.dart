import "package:flutter/material.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/pages/legal.dart";

/// 規約が更新されたことを知らせる帯。
///
/// `GET legal/summary` の `version` が `AuthUser.legalNoticeSeenVersion` と
/// 違えば、前回確認したときから規約が変わっている。Karotter Web と同じ判定。
///
/// 未ログイン時や、まだ一度も確認していない（`legalNoticeSeenVersion` が
/// null の）アカウントには出さない。初回ログイン直後に規約更新の帯が出ると
/// 何のことか分からないため。
class LegalNoticeBanner extends StatefulWidget {
  const LegalNoticeBanner({super.key});

  @override
  State<LegalNoticeBanner> createState() => _LegalNoticeBannerState();
}

class _LegalNoticeBannerState extends State<LegalNoticeBanner> {
  String? _newVersion;
  bool _dismissed = false;

  @override
  void initState() {
    super.initState();
    _check();
  }

  Future<void> _check() async {
    if (KarotterApi().session.accountId == null) return;

    try {
      final login = await KarotterApi().session.login();
      final seen = login?.user.legalNoticeSeenVersion;
      if (seen == null || seen.isEmpty) return;

      final summary = await KarotterApi().legal.summary();
      if (!mounted || summary.version.isEmpty || summary.version == seen) {
        return;
      }
      setState(() => _newVersion = summary.version);
    } catch (e) {
      // 規約の確認で画面を止める必要はない。黙って諦める。
      debugPrint("規約の更新確認に失敗: $e");
    }
  }

  /// 確認済みとして記録する。サーバーと手元の両方を更新する。
  Future<void> _acknowledge() async {
    final version = _newVersion;
    if (version == null) return;

    setState(() => _dismissed = true);

    try {
      await KarotterApi().users.updateSettings({
        'legalNoticeSeenVersion': version,
      });

      // 手元の控えも直しておかないと、次の起動でまた出る。
      final login = await KarotterApi().session.login();
      if (login != null) {
        await KarotterApi().session.saveLogin(
          login.copyWith(
            user: login.user.copyWith(legalNoticeSeenVersion: version),
          ),
        );
      }
    } catch (e) {
      debugPrint("規約の確認記録に失敗: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_newVersion == null || _dismissed) return const SizedBox.shrink();

    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
        child: Row(
          children: [
            const Icon(Icons.gavel, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                "規約・ポリシーが更新されました",
                style: theme.textTheme.bodyMedium,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LegalPage()),
              ),
              child: const Text("読む"),
            ),
            TextButton(onPressed: _acknowledge, child: const Text("確認した")),
          ],
        ),
      ),
    );
  }
}
