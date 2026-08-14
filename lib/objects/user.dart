import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karotator/enum.dart';

part 'user.freezed.dart';
part 'user.g.dart';

abstract interface class AbstractUser {
  int? get avatarFrameId;
  String? get avatarUrl;
  String get displayName;
  int get id;
  bool get isPrivate;
  bool get isBotAccount;
  bool get isParodyAccount;

  /// 運営が強制的に付けたパロディ / Bot の印。本人の設定より優先される。
  bool get adminForceParody;
  bool get adminForceBot;

  List<OfficialMark> get officialMark;
  String get username;
}

extension AbstractUserX on AbstractUser {
  /// 運営の強制設定を加味した判定。表示するアイコンはこちらで決める。
  bool get effectiveParody => isParodyAccount || adminForceParody;
  bool get effectiveBot => isBotAccount || adminForceBot;
}

/// カロートの作者や検索結果に埋め込まれる、軽いユーザー表現。
///
/// 同じ `author` でも、どのエンドポイントから来たかでフィールドが増減する。
/// 検索結果だけ `is_following` のようなスネークケースが混ざることに注意。
@freezed
abstract class Author with _$Author implements AbstractUser {
  const factory Author({
    int? avatarFrameId,
    String? avatarUrl,
    required String displayName,
    required int id,
    @Default(false) bool isPrivate,
    @Default(false) bool isBotAccount,
    @Default(false) bool isParodyAccount,
    @Default(false) bool adminForceParody,
    @Default(false) bool adminForceBot,
    @OfficialMarkListConverter() @Default([]) List<OfficialMark> officialMark,
    required String username,

    String? bio,
    @Default(false) bool isBanned,
    @Default(false) bool hideProfileFromMinors,
    int? profileMinimumAge,
    int? profileMaximumAge,

    @Default(0) int followersCount,
    @Default(0) int followingCount,
    @Default(0) int mutualFollowersCount,

    /// 閲覧者から見た関係。おすすめユーザーの一覧などに乗る。
    @Default(false) bool isFollowingByViewer,

    /// 検索結果だけスネークケースで来る。同じ意味の別名。
    @JsonKey(name: 'is_following') @Default(false) bool isFollowing,
    @JsonKey(name: 'is_followed_by') @Default(false) bool isFollowedBy,
    @JsonKey(name: 'follow_request_sent')
    @Default(false)
    bool followRequestSent,

    String? cardAccentColor,
    String? profileAccentColor,
    @Default('') String premiumBadgeColor,
    @Default([]) List<String> subscriptionBadgeColors,
    @Default('') String subscriptionPlan,
    @Default('') String subscriptionStatus,
    DateTime? subscriptionActiveUntil,
    @Default(false) bool showCardDecoration,
    @Default(false) bool showProfileDecoration,
    @Default(false) bool showSubscriptionBadges,
    @Default(false) bool showGreenBadge,
    @Default(false) bool showPlusBadge,
    @Default(false) bool showProBadge,
    @Default(false) bool showRedBadge,
  }) = _Author;

  factory Author.fromJson(Map<String, Object?> json) => _$AuthorFromJson(json);

  factory Author.empty() => Author(displayName: "", id: 0, username: "");
}

/// 他人のプロフィール。`GET users/{username}` の `user`。
@freezed
abstract class User with _$User implements AbstractUser {
  const factory User({
    int? avatarFrameId,
    String? avatarUrl,
    required String displayName,
    required int id,
    required bool isPrivate,
    required bool isBotAccount,
    required bool isParodyAccount,
    @Default(false) bool adminForceParody,
    @Default(false) bool adminForceBot,
    @OfficialMarkListConverter() @Default([]) List<OfficialMark> officialMark,
    required String username,
    int? pinnedPostId,
    String? headerUrl,
    String? bio,
    String? birthday,
    @JsonKey(unknownEnumValue: BirthdayVisibility.UNKNOWN)
    required BirthdayVisibility birthdayVisibility,
    required bool birthdayBalloonsEnabled,
    required bool hideProfileFromMinors,
    String? websiteUrl,
    String? location,
    @JsonKey(unknownEnumValue: OnlineStatus.UNKNOWN)
    required OnlineStatus onlineStatus,
    required int followersCount,
    required int followingCount,
    required int postsCount,
    required bool isPremium,
    required DateTime createdAt,
    required List<String> userBadges,
    int? age,
    required List<String> badges,

    @Default(false) bool isBanned,
    String? statusMessage,

    /// 生年月日の表示用文字列。`birthdayVisibility` を適用済み。
    String? displayBirthday,

    /// オンライン状態を誰に見せるか。`PUBLIC` / `FOLLOWERS` / `PRIVATE` など。
    @Default('') String onlineStatusVisibility,

    int? profileMinimumAge,
    int? profileMaximumAge,

    /// ピン留め。複数対応になったため `pinnedPostId` は残っているだけ。
    @Default([]) List<int> pinnedPostIds,
    @Default(0) int pinnedPostLimit,

    /// 質問箱を開けているか。
    @Default(false) bool questionsEnabled,

    /// いいね欄を公開しているか。
    @Default(false) bool showLikedPosts,

    /// DM の既読を相手に見せるか。
    @Default(false) bool showReadReceipts,

    @Default(false) bool levelEnabled,
    @Default(0) int level,
    @Default(0) int levelProgress,
    @Default(0) int experience,
    @Default(0) int experienceInLevel,
    @Default(0) int experienceToNextLevel,
    @Default(0) int experienceRequiredForNextLevel,

    String? cardAccentColor,
    String? profileAccentColor,
    @Default('') String premiumBadgeColor,
    @Default([]) List<String> subscriptionBadgeColors,
    @Default('') String subscriptionPlan,
    @Default('') String subscriptionStatus,
    DateTime? subscriptionActiveUntil,
    @Default(false) bool subscriptionCancelAtPeriodEnd,
    @Default(false) bool showCardDecoration,
    @Default(false) bool showProfileDecoration,
    @Default(false) bool showSubscriptionBadges,
    @Default(false) bool showGreenBadge,
    @Default(false) bool showPlusBadge,
    @Default(false) bool showProBadge,
    @Default(false) bool showRedBadge,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  factory User.empty() => User(
    displayName: "",
    id: 0,
    isPrivate: false,
    isBotAccount: false,
    isParodyAccount: false,
    isPremium: false,
    officialMark: [],
    username: "",
    birthdayVisibility: BirthdayVisibility.PRIVATE,
    birthdayBalloonsEnabled: true,
    birthday: null,
    hideProfileFromMinors: false,
    onlineStatus: OnlineStatus.OFFLINE,
    followersCount: 0,
    followingCount: 0,
    postsCount: 0,
    createdAt: DateTime(0),
    userBadges: [],
    badges: [],
  );
}

/// 自分自身。`POST auth/login` と `GET auth/me` が返す。
///
/// 他人のプロフィール ([User]) と違い、**アプリの設定が丸ごと乗っている**。
/// 設定画面はこれを読んで `PATCH users/settings` で書き戻す。
@freezed
abstract class AuthUser with _$AuthUser implements AbstractUser {
  const factory AuthUser({
    required int id,
    required String username,
    required String displayName,
    String? avatarUrl,
    int? avatarFrameId,
    String? headerUrl,
    String? bio,
    String? location,
    String? websiteUrl,
    String? statusMessage,

    String? email,
    @Default(false) bool emailVerified,

    /// メールアドレスのハッシュ。アバターの生成などに使われる。
    @Default('') String emailHash,
    @Default(false) bool hasPassword,
    @Default(false) bool twoFactorEnabled,
    @Default([]) List<String> linkedOAuthProviders,

    @Default(false) bool isPrivate,
    @Default(false) bool isBotAccount,
    @Default(false) bool isParodyAccount,
    @Default(false) bool adminForceParody,
    @Default(false) bool adminForceBot,
    @Default(false) bool adminForceR18,
    @Default(false) bool adminForceHidden,
    int? adminForceProfileMinimumAge,
    int? adminForceProfileMaximumAge,
    @OfficialMarkListConverter() @Default([]) List<OfficialMark> officialMark,

    @Default(false) bool isAdmin,
    @Default(false) bool isBanned,
    @Default(false) bool isRestricted,
    String? banReason,
    DateTime? bannedUntil,

    DateTime? birthday,
    String? displayBirthday,
    @Default('') String birthdayVisibility,
    @Default(false) bool birthdayBalloonsEnabled,
    @Default('') String gender,
    DateTime? createdAt,

    @Default(0) int followersCount,
    @Default(0) int followingCount,
    @Default(0) int postsCount,
    @Default(0) int points,
    @Default(0) int experience,
    @Default(false) bool levelEnabled,

    @Default(false) bool isPremium,
    DateTime? premiumUntil,

    // ---- 公開範囲 ----
    @Default(false) bool hideProfileFromMinors,
    int? profileMinimumAge,
    int? profileMaximumAge,
    @Default('') String onlineStatus,
    @Default('') String onlineStatusVisibility,
    @Default(false) bool questionsEnabled,
    @Default(false) bool giftsEnabled,
    @Default(false) bool showLikedPosts,
    @Default(false) bool showReadReceipts,

    // ---- DM ----
    @Default(false) bool directMessagesEnabled,

    /// 誰から DM を受けるか。`EVERYONE` / `FOLLOWING` など。
    @Default('') String dmRequestPolicy,

    // ---- タイムラインの見え方 ----
    @Default(false) bool showR18Content,
    @Default(false) bool showHiddenPosts,
    @Default(false) bool showBotAccounts,
    @Default(false) bool showParodyAccounts,
    @Default(false) bool showReactions,
    @Default(false) bool showRepliesInTimeline,
    @Default(false) bool showRekarotsInTimeline,
    @Default(false) bool hideUnfollowedRekarotsInTimeline,
    @Default([]) List<String> mutedKeywords,

    // ---- 投稿の既定値 ----
    @Default(false) bool defaultExcludeReplyTargets,

    // ---- 通知 ----
    @Default(false) bool notifyLikes,
    @Default(false) bool notifyReplies,
    @Default(false) bool notifyRekarots,
    @Default(false) bool notifyQuotes,
    @Default(false) bool notifyMentions,
    @Default(false) bool notifyFollows,
    @Default(false) bool notifyReactions,
    @Default(false) bool notifyDMs,
    @Default(false) bool notifyBoardActivity,
    @Default(false) bool notifyNewsOnLaunch,
    @Default(false) bool notificationMuteNewAccounts,
    @Default(false) bool notificationMuteNoAvatar,
    @Default(false) bool notificationMuteNonFollowers,
    @Default(false) bool notificationMuteNonFollowing,

    // ---- 規約 ----
    @Default(false) bool legalQuizPassed,

    /// 最後に読んだ利用規約のバージョン。文字列で比較される。
    String? legalNoticeSeenVersion,

    // ---- 課金 ----
    String? cardAccentColor,
    String? profileAccentColor,
    @Default('') String premiumBadgeColor,
    @Default([]) List<String> subscriptionBadgeColors,
    @Default('') String subscriptionPlan,
    @Default('') String subscriptionStatus,
    DateTime? subscriptionActiveUntil,
    @Default(false) bool subscriptionCancelAtPeriodEnd,
    @Default(false) bool showCardDecoration,
    @Default(false) bool showProfileDecoration,
    @Default(false) bool showSubscriptionBadges,
    @Default(false) bool showGreenBadge,
    @Default(false) bool showPlusBadge,
    @Default(false) bool showProBadge,
    @Default(false) bool showRedBadge,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, Object?> json) =>
      _$AuthUserFromJson(json);
}
