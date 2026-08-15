// ignore_for_file: constant_identifier_names — Karotter の値をそのまま使う

import 'package:karotator/objects/pro_reactions.dart';
import 'package:karotator/objects/user.dart';

/// 契約プラン。
enum SubscriptionPlan { FREE, PLUS, PRO }

/// 契約の状態と期限を加味した実効プラン。
///
/// **`subscriptionPlan` を直接見てはいけない。** 解約済みや期限切れでも
/// プラン名だけは残るので、状態と期限まで見ないと PRO 限定機能が漏れる。
/// 判定は Karotter Web の `subscription` チャンクをそのまま写している。
///
/// ```js
/// plan !== "FREE" && (status === "ACTIVE" || status === "TRIALING")
///   && (!activeUntil || activeUntil > now) ? plan : "FREE"
/// ```
///
/// 仕様: specs/005-rich-text/design.md §2 (REQ-RICH-008)
SubscriptionPlan effectiveSubscriptionPlan({
  required String plan,
  required String status,
  DateTime? activeUntil,
  DateTime? now,
}) {
  final normalized = _normalize(plan);
  if (normalized == SubscriptionPlan.FREE) return SubscriptionPlan.FREE;

  if (status != 'ACTIVE' && status != 'TRIALING') return SubscriptionPlan.FREE;

  if (activeUntil != null && !activeUntil.isAfter(now ?? DateTime.now())) {
    return SubscriptionPlan.FREE;
  }

  return normalized;
}

/// 知らないプラン名は FREE に落とす。
SubscriptionPlan _normalize(String plan) => switch (plan) {
  'PRO' => SubscriptionPlan.PRO,
  'PLUS' => SubscriptionPlan.PLUS,
  _ => SubscriptionPlan.FREE,
};

extension AuthUserSubscriptionX on AuthUser {
  SubscriptionPlan get effectivePlan => effectiveSubscriptionPlan(
    plan: subscriptionPlan,
    status: subscriptionStatus,
    activeUntil: subscriptionActiveUntil,
  );
}

extension AuthorSubscriptionX on Author {
  SubscriptionPlan get effectivePlan => effectiveSubscriptionPlan(
    plan: subscriptionPlan,
    status: subscriptionStatus,
    activeUntil: subscriptionActiveUntil,
  );
}

extension UserSubscriptionX on User {
  SubscriptionPlan get effectivePlan => effectiveSubscriptionPlan(
    plan: subscriptionPlan,
    status: subscriptionStatus,
    activeUntil: subscriptionActiveUntil,
  );
}

/// そのリアクションを新たに付けられるか。
///
/// pro リアクションは PRO プランだけが付けられる。ただし [reacted] が真なら
/// 通す。PRO を切らした後でも自分が付けたものは外せる必要があるため
/// (REQ-RICH-005, 007)。
bool canAddReaction(
  String code, {
  required bool isPro,
  required bool reacted,
}) => !isProReaction(code) || isPro || reacted;
