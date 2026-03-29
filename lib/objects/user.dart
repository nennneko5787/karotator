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
  List<OfficialMark> get officialMark;
  String get username;
}

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
    @Default([]) List<OfficialMark> officialMark,
    required String username,
  }) = _Author;

  factory Author.fromJson(Map<String, Object?> json) => _$AuthorFromJson(json);

  factory Author.empty() => Author(displayName: "", id: 0, username: "");
}

@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    String? avatarUrl,
    required String displayName,
    required int id,
    String? email,
    required bool emailVerified,
    required String username,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, Object?> json) =>
      _$AuthUserFromJson(json);
}

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
    required List<OfficialMark> officialMark,
    required String username,
    int? pinnedPostId,
    String? headerUrl,
    String? bio,
    String? birthday,
    required BirthdayVisibility birthdayVisibility,
    required bool birthdayBalloonsEnabled,
    required bool hideProfileFromMinors,
    String? websiteUrl,
    String? location,
    required OnlineStatus onlineStatus,
    required int followersCount,
    required int followingCount,
    required int postsCount,
    required bool isPremium,
    required DateTime createdAt,
    required List<String> userBadges,
    int? age,
    required List<String> badges,
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
