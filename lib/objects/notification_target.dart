import 'package:karotator/enum.dart';
import 'package:karotator/objects/notification.dart';

/// 投稿制限を伝える SYSTEM 通知の行き先 (REQ-GATE-006)。
///
/// karotator は名前付きルートを持たないので、パス文字列をそのまま扱わず
/// 必要な行き先だけを列挙する（仕様: specs/004-posting-restrictions/design.md §7）。
enum SystemNotificationTarget { legalQuiz, accountSettings }

/// 通知の行き先を決める。
///
/// Karotter Web と同じ順で見る。
///
/// 1. サーバーが付けた `route`。文言が変わっても効く
/// 2. 無ければ本文の前方一致
///
/// 該当しなければ null。呼び出し側は通常の遷移（カロート詳細など）に落とす。
SystemNotificationTarget? systemNotificationTarget(Notification notification) {
  final route = notification.route;
  // `//` で始まるものはプロトコル相対 URL になりうるので弾く。Web も同じガード。
  if (route != null && route.startsWith('/') && !route.startsWith('//')) {
    if (route.startsWith('/legal-quiz')) return SystemNotificationTarget.legalQuiz;
    if (route.startsWith('/settings')) {
      return SystemNotificationTarget.accountSettings;
    }
    // route はあるが karotator に対応する画面が無い。
    return null;
  }

  if (notification.type != NotificationType.SYSTEM) return null;

  final message = notification.message ?? '';
  if (message.startsWith('規約クイズにまだ合格していないため投稿できません')) {
    return SystemNotificationTarget.legalQuiz;
  }
  if (message.startsWith('まだメール認証が完了していないため投稿できません')) {
    return SystemNotificationTarget.accountSettings;
  }
  return null;
}
