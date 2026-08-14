# 観測したレスポンススキーマ

<!-- このファイルは自動生成される。手で編集しない。 -->
<!-- 再生成: dart run tool/capture_api_samples.dart -->

実際の Karotter API を 1 回叩いて得たレスポンスから、
**フィールド名と型だけ**を抜き出したもの。値は含まない。

> [!NOTE]
> 1 アカウント・1 回の観測に基づく。`nullable` は「今回 null だった」
> または「今回の配列要素の一部に無かった」という意味でしかない。
> 必須かどうかの最終判断は [conventions.md](conventions.md) と
> [schemas/](schemas/) の公式スキーマを優先すること。

## auth.me

- `user`: `User`
  - `adminForceBot`: `bool`
  - `adminForceHidden`: `bool`
  - `adminForceParody`: `bool`
  - `adminForceProfileMaximumAge`: `Object?`
  - `adminForceProfileMinimumAge`: `Object?`
  - `adminForceR18`: `bool`
  - `avatarFrameId`: `Object?`
  - `avatarUrl`: `Object?`
  - `banReason`: `Object?`
  - `bannedUntil`: `Object?`
  - `bio`: `Object?`
  - `birthday`: `DateTime`
  - `birthdayBalloonsEnabled`: `bool`
  - `birthdayVisibility`: `String`
  - `cardAccentColor`: `Object?`
  - `createdAt`: `DateTime`
  - `defaultExcludeReplyTargets`: `bool`
  - `directMessagesEnabled`: `bool`
  - `displayBirthday`: `Object?`
  - `displayName`: `String`
  - `dmRequestPolicy`: `String`
  - `email`: `String`
  - `emailHash`: `String`
  - `emailVerified`: `bool`
  - `experience`: `int`
  - `followersCount`: `int`
  - `followingCount`: `int`
  - `gender`: `String`
  - `giftsEnabled`: `bool`
  - `hasPassword`: `bool`
  - `headerUrl`: `Object?`
  - `hideProfileFromMinors`: `bool`
  - `hideUnfollowedRekarotsInTimeline`: `bool`
  - `id`: `int`
  - `isAdmin`: `bool`
  - `isBanned`: `bool`
  - `isBotAccount`: `bool`
  - `isParodyAccount`: `bool`
  - `isPremium`: `bool`
  - `isPrivate`: `bool`
  - `isRestricted`: `bool`
  - `legalNoticeSeenVersion`: `Object?`
  - `legalQuizPassed`: `bool`
  - `levelEnabled`: `bool`
  - `linkedOAuthProviders`: `List<Object?>`
  - `location`: `Object?`
  - `mutedKeywords`: `List<Object?>`
  - `notificationMuteNewAccounts`: `bool`
  - `notificationMuteNoAvatar`: `bool`
  - `notificationMuteNonFollowers`: `bool`
  - `notificationMuteNonFollowing`: `bool`
  - `notifyBoardActivity`: `bool`
  - `notifyDMs`: `bool`
  - `notifyFollows`: `bool`
  - `notifyLikes`: `bool`
  - `notifyMentions`: `bool`
  - `notifyNewsOnLaunch`: `bool`
  - `notifyQuotes`: `bool`
  - `notifyReactions`: `bool`
  - `notifyRekarots`: `bool`
  - `notifyReplies`: `bool`
  - `officialMark`: `List<Object?>`
  - `onlineStatus`: `String`
  - `onlineStatusVisibility`: `String`
  - `points`: `int`
  - `postsCount`: `int`
  - `premiumBadgeColor`: `String`
  - `premiumUntil`: `Object?`
  - `profileAccentColor`: `Object?`
  - `profileMaximumAge`: `Object?`
  - `profileMinimumAge`: `Object?`
  - `questionsEnabled`: `bool`
  - `showBotAccounts`: `bool`
  - `showCardDecoration`: `bool`
  - `showGreenBadge`: `bool`
  - `showHiddenPosts`: `bool`
  - `showLikedPosts`: `bool`
  - `showParodyAccounts`: `bool`
  - `showPlusBadge`: `bool`
  - `showProBadge`: `bool`
  - `showProfileDecoration`: `bool`
  - `showR18Content`: `bool`
  - `showReactions`: `bool`
  - `showReadReceipts`: `bool`
  - `showRedBadge`: `bool`
  - `showRekarotsInTimeline`: `bool`
  - `showRepliesInTimeline`: `bool`
  - `showSubscriptionBadges`: `bool`
  - `statusMessage`: `Object?`
  - `subscriptionActiveUntil`: `Object?`
  - `subscriptionBadgeColors`: `List<Object?>`
  - `subscriptionCancelAtPeriodEnd`: `bool`
  - `subscriptionPlan`: `String`
  - `subscriptionStatus`: `String`
  - `twoFactorEnabled`: `bool`
  - `username`: `String`
  - `websiteUrl`: `Object?`

## posts.timeline

- `pagination`: `Pagination`
  - `hasNext`: `bool`
  - `limit`: `int`
  - `mode`: `String`
  - `nextCursor`: `Object?`
  - `page`: `int`
- `posts`: `List<Object?>`

## posts.recommended

- `pagination`: `Pagination`
  - `limit`: `int`
  - `page`: `int`
- `posts`: `List<Object>`
  - `adminForceMaximumAge`: `Object?`
  - `adminForceMinimumAge`: `Object?`
  - `adminForceR18`: `bool`
  - `author`: `Author`
    - `avatarFrameId`: `Object?`
    - `avatarUrl`: `String`
    - `cardAccentColor`: `String?`
    - `displayName`: `String`
    - `hideProfileFromMinors`: `bool`
    - `id`: `int`
    - `isBotAccount`: `bool`
    - `isFollowingByViewer`: `bool`
    - `isParodyAccount`: `bool`
    - `isPrivate`: `bool`
    - `officialMark`: `List<String>`
    - `premiumBadgeColor`: `String`
    - `profileAccentColor`: `String?`
    - `profileMaximumAge`: `Object?`
    - `profileMinimumAge`: `int?`
    - `showCardDecoration`: `bool`
    - `showGreenBadge`: `bool`
    - `showPlusBadge`: `bool`
    - `showProBadge`: `bool`
    - `showProfileDecoration`: `bool`
    - `showRedBadge`: `bool`
    - `showSubscriptionBadges`: `bool`
    - `subscriptionActiveUntil`: `DateTime?`
    - `subscriptionBadgeColors`: `List<String>`
    - `subscriptionPlan`: `String`
    - `subscriptionStatus`: `String`
    - `username`: `String`
  - `authorId`: `int`
  - `bookmarked`: `bool`
  - `bookmarksCount`: `int`
  - `canInteract`: `bool`
  - `canQuote`: `bool`
  - `community`: `Object?`
  - `communityId`: `Object?`
  - `content`: `String`
  - `createdAt`: `DateTime`
  - `editedAt`: `DateTime?`
  - `effectiveMaximumAge`: `Object?`
  - `effectiveMinimumAge`: `int?`
  - `expiresAt`: `Object?`
  - `hasBlockedAuthor`: `bool`
  - `hideFromMinors`: `bool`
  - `id`: `int`
  - `isAiGenerated`: `bool`
  - `isBlockedByAuthor`: `bool`
  - `isMutedByViewer`: `bool`
  - `isPromotional`: `bool`
  - `isR18`: `bool`
  - `liked`: `bool`
  - `likesCount`: `int`
  - `maximumAge`: `Object?`
  - `mediaAlts`: `List<String>`
  - `mediaR18Flags`: `List<bool>`
  - `mediaSpoilerFlags`: `List<bool>`
  - `mediaUrls`: `List<String>`
  - `minimumAge`: `Object?`
  - `parentId`: `Object?`
  - `poll`: `Object?`
  - `quoteUsersCount`: `int`
  - `quotedPost`: `QuotedPost?`
    - `adminForceR18`: `bool?`  — 1/6 件で欠落
    - `author`: `Author?`  — 1/6 件で欠落
      - `avatarUrl`: `String`
      - `cardAccentColor`: `Object?`
      - `displayName`: `String`
      - `hideProfileFromMinors`: `bool`
      - `id`: `int`
      - `isBotAccount`: `bool`
      - `isFollowingByViewer`: `bool`
      - `isParodyAccount`: `bool`
      - `isPrivate`: `bool`
      - `officialMark`: `List<String>`
      - `premiumBadgeColor`: `String`
      - `profileAccentColor`: `Object?`
      - `profileMaximumAge`: `Object?`
      - `profileMinimumAge`: `int?`
      - `showCardDecoration`: `bool`
      - `showGreenBadge`: `bool`
      - `showPlusBadge`: `bool`
      - `showProBadge`: `bool`
      - `showProfileDecoration`: `bool`
      - `showRedBadge`: `bool`
      - `showSubscriptionBadges`: `bool`
      - `subscriptionActiveUntil`: `DateTime?`
      - `subscriptionBadgeColors`: `List<String>`
      - `subscriptionPlan`: `String`
      - `subscriptionStatus`: `String`
      - `username`: `String`
    - `canView`: `bool?`  — 1/6 件で欠落
    - `community`: `Object?`  — 1/6 件で欠落
    - `communityId`: `Object?`  — 1/6 件で欠落
    - `content`: `String?`  — 1/6 件で欠落
    - `createdAt`: `DateTime?`  — 1/6 件で欠落
    - `editedAt`: `Object?`  — 1/6 件で欠落
    - `effectiveMaximumAge`: `Object?`  — 1/6 件で欠落
    - `effectiveMinimumAge`: `int?`  — 1/6 件で欠落
    - `expiresAt`: `Object?`  — 1/6 件で欠落
    - `hideFromMinors`: `bool?`  — 1/6 件で欠落
    - `id`: `int?`  — 1/6 件で欠落
    - `isAiGenerated`: `bool?`  — 1/6 件で欠落
    - `isPromotional`: `bool?`  — 1/6 件で欠落
    - `isR18`: `bool?`  — 1/6 件で欠落
    - `maximumAge`: `Object?`  — 1/6 件で欠落
    - `mediaAlts`: `List<Object?>?`  — 1/6 件で欠落
    - `mediaR18Flags`: `List<Object?>?`  — 1/6 件で欠落
    - `mediaSpoilerFlags`: `List<Object?>?`  — 1/6 件で欠落
    - `mediaUrls`: `List<Object?>?`  — 1/6 件で欠落
    - `minimumAge`: `Object?`  — 1/6 件で欠落
    - `parentId`: `Object?`  — 1/6 件で欠落
    - `poll`: `Object?`  — 1/6 件で欠落
    - `quotedPost`: `Object?`  — 1/6 件で欠落
    - `quotedPostId`: `Object?`  — 1/6 件で欠落
    - `replyCircle`: `Object?`  — 1/6 件で欠落
    - `replyCircleId`: `Object?`  — 1/6 件で欠落
    - `replyRestriction`: `String?`  — 1/6 件で欠落
    - `replyToUsers`: `List<Object>?`  — 1/6 件で欠落
      - `avatarFrameId`: `Object?`
      - `avatarUrl`: `String`
      - `displayName`: `String`
      - `hideProfileFromMinors`: `bool`
      - `id`: `int`
      - `isBotAccount`: `bool`
      - `isFollowingByViewer`: `bool`
      - `isParodyAccount`: `bool`
      - `isPrivate`: `bool`
      - `officialMark`: `List<Object?>`
      - `profileMaximumAge`: `Object?`
      - `profileMinimumAge`: `Object?`
      - `username`: `String`
    - `viewerCircle`: `Object?`  — 1/6 件で欠落
    - `viewerCircleId`: `Object?`  — 1/6 件で欠落
    - `visibility`: `String?`  — 1/6 件で欠落
  - `quotedPostId`: `int?`
  - `reactionSummary`: `List<Object>`
    - `count`: `int`
    - `emoji`: `String`
    - `reacted`: `bool`
  - `rekaroted`: `bool`
  - `rekarotsCount`: `int`
  - `repliesCount`: `int`
  - `replyCircle`: `Object?`
  - `replyCircleId`: `Object?`
  - `replyRestriction`: `String`
  - `replyToUsers`: `List<Object>`
    - `avatarFrameId`: `Object?`
    - `avatarUrl`: `String`
    - `displayName`: `String`
    - `hideProfileFromMinors`: `bool`
    - `id`: `int`
    - `isBotAccount`: `bool`
    - `isFollowingByViewer`: `bool`
    - `isParodyAccount`: `bool`
    - `isPrivate`: `bool`
    - `officialMark`: `List<Object?>`
    - `profileMaximumAge`: `Object?`
    - `profileMinimumAge`: `Object?`
    - `username`: `String`
  - `updatedAt`: `DateTime`
  - `viewerCircle`: `Object?`
  - `viewerCircleId`: `Object?`
  - `viewsCount`: `int`
  - `visibility`: `String`

## posts.recommended.latest

- `pagination`: `Pagination`
  - `hasNext`: `bool`
  - `limit`: `int`
  - `mode`: `String`
  - `nextCursor`: `String`
  - `page`: `int`
- `posts`: `List<Object>`
  - `adminForceMaximumAge`: `Object?`
  - `adminForceMinimumAge`: `Object?`
  - `adminForceR18`: `bool`
  - `author`: `Author`
    - `avatarFrameId`: `Object?`
    - `avatarUrl`: `String?`
    - `cardAccentColor`: `String?`
    - `displayName`: `String`
    - `hideProfileFromMinors`: `bool`
    - `id`: `int`
    - `isBotAccount`: `bool`
    - `isFollowingByViewer`: `bool`
    - `isParodyAccount`: `bool`
    - `isPrivate`: `bool`
    - `officialMark`: `List<String>`
    - `premiumBadgeColor`: `String`
    - `profileAccentColor`: `String?`
    - `profileMaximumAge`: `Object?`
    - `profileMinimumAge`: `int?`
    - `showCardDecoration`: `bool`
    - `showGreenBadge`: `bool`
    - `showPlusBadge`: `bool`
    - `showProBadge`: `bool`
    - `showProfileDecoration`: `bool`
    - `showRedBadge`: `bool`
    - `showSubscriptionBadges`: `bool`
    - `subscriptionActiveUntil`: `DateTime?`
    - `subscriptionBadgeColors`: `List<String>`
    - `subscriptionPlan`: `String`
    - `subscriptionStatus`: `String`
    - `username`: `String`
  - `authorId`: `int`
  - `bookmarked`: `bool`
  - `bookmarksCount`: `int`
  - `canInteract`: `bool`
  - `canQuote`: `bool`
  - `comment`: `Object?`  — 15/20 件で欠落
  - `community`: `Object?`
  - `communityId`: `Object?`
  - `content`: `String`
  - `createdAt`: `DateTime`
  - `editedAt`: `Object?`
  - `effectiveMaximumAge`: `Object?`
  - `effectiveMinimumAge`: `int?`
  - `expiresAt`: `Object?`
  - `hasBlockedAuthor`: `bool`
  - `hideFromMinors`: `bool`
  - `id`: `int`
  - `isAiGenerated`: `bool`
  - `isBlockedByAuthor`: `bool`
  - `isMutedByViewer`: `bool`
  - `isPromotional`: `bool`
  - `isR18`: `bool`
  - `itemId`: `String`
  - `liked`: `bool`
  - `likesCount`: `int`
  - `maximumAge`: `Object?`
  - `mediaAlts`: `List<String>`
  - `mediaR18Flags`: `List<bool>`
  - `mediaSpoilerFlags`: `List<bool>`
  - `mediaUrls`: `List<String>`
  - `minimumAge`: `int?`
  - `parentId`: `Object?`
  - `poll`: `Object?`
  - `quoteUsersCount`: `int`
  - `quotedPost`: `QuotedPost?`
    - `adminForceR18`: `bool?`  — 5/8 件で欠落
    - `author`: `Author?`  — 5/8 件で欠落
      - `avatarUrl`: `String`
      - `cardAccentColor`: `Object?`
      - `displayName`: `String`
      - `hideProfileFromMinors`: `bool`
      - `id`: `int`
      - `isBotAccount`: `bool`
      - `isFollowingByViewer`: `bool`
      - `isParodyAccount`: `bool`
      - `isPrivate`: `bool`
      - `officialMark`: `List<String>`
      - `premiumBadgeColor`: `String`
      - `profileAccentColor`: `Object?`
      - `profileMaximumAge`: `Object?`
      - `profileMinimumAge`: `int?`
      - `showCardDecoration`: `bool`
      - `showGreenBadge`: `bool`
      - `showPlusBadge`: `bool`
      - `showProBadge`: `bool`
      - `showProfileDecoration`: `bool`
      - `showRedBadge`: `bool`
      - `showSubscriptionBadges`: `bool`
      - `subscriptionActiveUntil`: `DateTime?`
      - `subscriptionBadgeColors`: `List<String>`
      - `subscriptionPlan`: `String`
      - `subscriptionStatus`: `String`
      - `username`: `String`
    - `canView`: `bool?`  — 5/8 件で欠落
    - `community`: `Object?`  — 5/8 件で欠落
    - `communityId`: `Object?`  — 5/8 件で欠落
    - `content`: `String?`  — 5/8 件で欠落
    - `createdAt`: `DateTime?`  — 5/8 件で欠落
    - `editedAt`: `Object?`  — 5/8 件で欠落
    - `effectiveMaximumAge`: `Object?`  — 5/8 件で欠落
    - `effectiveMinimumAge`: `int?`  — 5/8 件で欠落
    - `expiresAt`: `Object?`  — 5/8 件で欠落
    - `hideFromMinors`: `bool?`  — 5/8 件で欠落
    - `id`: `int?`  — 5/8 件で欠落
    - `isAiGenerated`: `bool?`  — 5/8 件で欠落
    - `isPromotional`: `bool?`  — 5/8 件で欠落
    - `isR18`: `bool?`  — 5/8 件で欠落
    - `maximumAge`: `Object?`  — 5/8 件で欠落
    - `mediaAlts`: `List<Object?>?`  — 5/8 件で欠落
    - `mediaR18Flags`: `List<Object?>?`  — 5/8 件で欠落
    - `mediaSpoilerFlags`: `List<Object?>?`  — 5/8 件で欠落
    - `mediaUrls`: `List<Object?>?`  — 5/8 件で欠落
    - `minimumAge`: `Object?`  — 5/8 件で欠落
    - `parentId`: `Object?`  — 5/8 件で欠落
    - `poll`: `Object?`  — 5/8 件で欠落
    - `quotedPost`: `Object?`  — 5/8 件で欠落
    - `quotedPostId`: `Object?`  — 5/8 件で欠落
    - `replyCircle`: `Object?`  — 5/8 件で欠落
    - `replyCircleId`: `Object?`  — 5/8 件で欠落
    - `replyRestriction`: `String?`  — 5/8 件で欠落
    - `replyToUsers`: `List<Object>?`  — 5/8 件で欠落
      - `avatarFrameId`: `Object?`
      - `avatarUrl`: `String`
      - `displayName`: `String`
      - `hideProfileFromMinors`: `bool`
      - `id`: `int`
      - `isBotAccount`: `bool`
      - `isFollowingByViewer`: `bool`
      - `isParodyAccount`: `bool`
      - `isPrivate`: `bool`
      - `officialMark`: `List<Object?>`
      - `profileMaximumAge`: `Object?`
      - `profileMinimumAge`: `Object?`
      - `username`: `String`
    - `viewerCircle`: `Object?`  — 5/8 件で欠落
    - `viewerCircleId`: `Object?`  — 5/8 件で欠落
    - `visibility`: `String?`  — 5/8 件で欠落
  - `quotedPostId`: `int?`
  - `reactionSummary`: `List<Object>`
    - `count`: `int`
    - `emoji`: `String`
    - `reacted`: `bool`
  - `rekaroted`: `bool`
  - `rekarotedBy`: `RekarotedBy?`  — 15/20 件で欠落
    - `avatarFrameId`: `Object?`
    - `avatarUrl`: `String`
    - `cardAccentColor`: `Object?`
    - `displayName`: `String`
    - `hideProfileFromMinors`: `bool`
    - `id`: `int`
    - `isBotAccount`: `bool`
    - `isFollowingByViewer`: `bool`
    - `isParodyAccount`: `bool`
    - `isPrivate`: `bool`
    - `officialMark`: `List<String>`
    - `premiumBadgeColor`: `String`
    - `profileAccentColor`: `Object?`
    - `profileMaximumAge`: `Object?`
    - `profileMinimumAge`: `int`
    - `showCardDecoration`: `bool`
    - `showGreenBadge`: `bool`
    - `showPlusBadge`: `bool`
    - `showProBadge`: `bool`
    - `showProfileDecoration`: `bool`
    - `showRedBadge`: `bool`
    - `showSubscriptionBadges`: `bool`
    - `subscriptionActiveUntil`: `DateTime`
    - `subscriptionBadgeColors`: `List<String>`
    - `subscriptionPlan`: `String`
    - `subscriptionStatus`: `String`
    - `username`: `String`
  - `rekarotsCount`: `int`
  - `repliesCount`: `int`
  - `replyCircle`: `Object?`
  - `replyCircleId`: `Object?`
  - `replyRestriction`: `String`
  - `replyToUsers`: `List<Object>`
    - `avatarFrameId`: `Object?`
    - `avatarUrl`: `String`
    - `displayName`: `String`
    - `hideProfileFromMinors`: `bool`
    - `id`: `int`
    - `isBotAccount`: `bool`
    - `isFollowingByViewer`: `bool`
    - `isParodyAccount`: `bool`
    - `isPrivate`: `bool`
    - `officialMark`: `List<Object?>`
    - `profileMaximumAge`: `Object?`
    - `profileMinimumAge`: `Object?`
    - `username`: `String`
  - `time`: `DateTime`
  - `type`: `String`
  - `updatedAt`: `DateTime`
  - `viewerCircle`: `Object?`
  - `viewerCircleId`: `Object?`
  - `viewsCount`: `int`
  - `visibility`: `String`

## posts.byId

- `post`: `Post`
  - `adminForceMaximumAge`: `Object?`
  - `adminForceMinimumAge`: `Object?`
  - `adminForceR18`: `bool`
  - `author`: `Author`
    - `avatarFrameId`: `Object?`
    - `avatarUrl`: `String`
    - `cardAccentColor`: `Object?`
    - `displayName`: `String`
    - `hideProfileFromMinors`: `bool`
    - `id`: `int`
    - `isBotAccount`: `bool`
    - `isFollowingByViewer`: `bool`
    - `isParodyAccount`: `bool`
    - `isPrivate`: `bool`
    - `officialMark`: `List<String>`
    - `premiumBadgeColor`: `String`
    - `profileAccentColor`: `Object?`
    - `profileMaximumAge`: `Object?`
    - `profileMinimumAge`: `int`
    - `showCardDecoration`: `bool`
    - `showGreenBadge`: `bool`
    - `showPlusBadge`: `bool`
    - `showProBadge`: `bool`
    - `showProfileDecoration`: `bool`
    - `showRedBadge`: `bool`
    - `showSubscriptionBadges`: `bool`
    - `subscriptionActiveUntil`: `DateTime`
    - `subscriptionBadgeColors`: `List<Object?>`
    - `subscriptionPlan`: `String`
    - `subscriptionStatus`: `String`
    - `username`: `String`
  - `authorId`: `int`
  - `bookmarked`: `bool`
  - `bookmarksCount`: `int`
  - `canInteract`: `bool`
  - `canQuote`: `bool`
  - `community`: `Object?`
  - `communityId`: `Object?`
  - `content`: `String`
  - `createdAt`: `DateTime`
  - `editedAt`: `Object?`
  - `effectiveMaximumAge`: `Object?`
  - `effectiveMinimumAge`: `int`
  - `expiresAt`: `Object?`
  - `hasBlockedAuthor`: `bool`
  - `hideFromMinors`: `bool`
  - `id`: `int`
  - `isAiGenerated`: `bool`
  - `isBlockedByAuthor`: `bool`
  - `isMutedByViewer`: `bool`
  - `isPromotional`: `bool`
  - `isR18`: `bool`
  - `liked`: `bool`
  - `likesCount`: `int`
  - `maximumAge`: `Object?`
  - `mediaAlts`: `List<String>`
  - `mediaR18Flags`: `List<bool>`
  - `mediaSpoilerFlags`: `List<bool>`
  - `mediaUrls`: `List<String>`
  - `minimumAge`: `Object?`
  - `parentId`: `Object?`
  - `poll`: `Object?`
  - `quotePostsCount`: `int`
  - `quoteUsersCount`: `int`
  - `quotedPost`: `Object?`
  - `quotedPostId`: `Object?`
  - `reactionSummary`: `List<Object?>`
  - `rekaroted`: `bool`
  - `rekarotsCount`: `int`
  - `repliesCount`: `int`
  - `replyCircle`: `Object?`
  - `replyCircleId`: `Object?`
  - `replyRestriction`: `String`
  - `replyToUsers`: `List<Object>`
    - `avatarFrameId`: `Object?`
    - `avatarUrl`: `String`
    - `displayName`: `String`
    - `hideProfileFromMinors`: `bool`
    - `id`: `int`
    - `isBotAccount`: `bool`
    - `isFollowingByViewer`: `bool`
    - `isParodyAccount`: `bool`
    - `isPrivate`: `bool`
    - `officialMark`: `List<Object?>`
    - `profileMaximumAge`: `Object?`
    - `profileMinimumAge`: `Object?`
    - `username`: `String`
  - `updatedAt`: `DateTime`
  - `viewerCircle`: `Object?`
  - `viewerCircleId`: `Object?`
  - `viewsCount`: `int`
  - `visibility`: `String`

## posts.replies

- `pagination`: `Pagination`
  - `limit`: `int`
  - `page`: `int`
  - `pages`: `int`
  - `total`: `int`
- `replies`: `List<Object?>`

## posts.replyTargets

- `candidates`: `List<Object>`
  - `adminForceBot`: `bool`
  - `adminForceParody`: `bool`
  - `avatarUrl`: `String?`
  - `displayName`: `String`
  - `id`: `int`
  - `isBotAccount`: `bool`
  - `isParodyAccount`: `bool`
  - `isPrivate`: `bool`
  - `officialMark`: `List<Object?>`
  - `username`: `String`
- `excludedUserIds`: `List<Object?>`
- `rootPostId`: `int`
- `selectedUserIds`: `List<int>`

## posts.bookmarks

- `pagination`: `Pagination`
  - `hasNext`: `bool`
  - `limit`: `int`
  - `page`: `int`
- `posts`: `List<Object?>`

## posts.scheduled

- `scheduledPosts`: `List<Object?>`

## users.byUsername

- `hasBlocked`: `bool`
- `hasPendingRequest`: `bool`
- `isBlocked`: `bool`
- `isBlockedBy`: `bool`
- `isFollowedBy`: `bool`
- `isFollowing`: `bool`
- `isMuted`: `bool`
- `isPostNotificationsEnabled`: `bool`
- `isRekarotHidden`: `bool`
- `mutualFollowersCount`: `int`
- `mutualFollowersPreview`: `List<Object?>`
- `pinnedPost`: `Object?`
- `pinnedPosts`: `List<Object?>`
- `user`: `User`
  - `age`: `Object?`
  - `avatarFrameId`: `Object?`
  - `avatarUrl`: `Object?`
  - `badges`: `List<Object?>`
  - `bio`: `Object?`
  - `birthday`: `Object?`
  - `birthdayBalloonsEnabled`: `bool`
  - `birthdayVisibility`: `String`
  - `cardAccentColor`: `Object?`
  - `createdAt`: `DateTime`
  - `displayBirthday`: `Object?`
  - `displayName`: `String`
  - `experience`: `int`
  - `experienceInLevel`: `int`
  - `experienceRequiredForNextLevel`: `int`
  - `experienceToNextLevel`: `int`
  - `followersCount`: `int`
  - `followingCount`: `int`
  - `headerUrl`: `Object?`
  - `hideProfileFromMinors`: `bool`
  - `id`: `int`
  - `isBanned`: `bool`
  - `isBotAccount`: `bool`
  - `isParodyAccount`: `bool`
  - `isPremium`: `bool`
  - `isPrivate`: `bool`
  - `level`: `int`
  - `levelEnabled`: `bool`
  - `levelProgress`: `int`
  - `location`: `Object?`
  - `officialMark`: `List<Object?>`
  - `onlineStatus`: `String`
  - `onlineStatusVisibility`: `String`
  - `pinnedPostId`: `Object?`
  - `pinnedPostIds`: `List<Object?>`
  - `pinnedPostLimit`: `int`
  - `postsCount`: `int`
  - `premiumBadgeColor`: `String`
  - `profileAccentColor`: `Object?`
  - `profileMaximumAge`: `Object?`
  - `profileMinimumAge`: `Object?`
  - `questionsEnabled`: `bool`
  - `showCardDecoration`: `bool`
  - `showGreenBadge`: `bool`
  - `showLikedPosts`: `bool`
  - `showPlusBadge`: `bool`
  - `showProBadge`: `bool`
  - `showProfileDecoration`: `bool`
  - `showReadReceipts`: `bool`
  - `showRedBadge`: `bool`
  - `showSubscriptionBadges`: `bool`
  - `statusMessage`: `Object?`
  - `subscriptionActiveUntil`: `Object?`
  - `subscriptionBadgeColors`: `List<Object?>`
  - `subscriptionCancelAtPeriodEnd`: `bool`
  - `subscriptionPlan`: `String`
  - `subscriptionStatus`: `String`
  - `userBadges`: `List<Object?>`
  - `username`: `String`
  - `websiteUrl`: `Object?`

## users.posts

- `pagination`: `Pagination`
  - `hasNext`: `bool`
  - `limit`: `int`
  - `nextCursor`: `Object?`
  - `page`: `int`
  - `pages`: `int`
  - `total`: `int`
- `posts`: `List<Object?>`

## users.replies

- `pagination`: `Pagination`
  - `hasNext`: `bool`
  - `limit`: `int`
  - `nextCursor`: `Object?`
  - `page`: `int`
  - `pages`: `int`
  - `total`: `int`
- `posts`: `List<Object?>`

## users.media

- `pagination`: `Pagination`
  - `hasNext`: `bool`
  - `limit`: `int`
  - `page`: `int`
  - `pages`: `int`
  - `total`: `int`
- `posts`: `List<Object?>`

## users.likes

- `pagination`: `Pagination`
  - `hasNext`: `bool`
  - `limit`: `int`
  - `page`: `int`
  - `pages`: `int`
  - `total`: `int`
- `posts`: `List<Object?>`

## users.recommended

- `users`: `List<Object>`
  - `avatarUrl`: `String`
  - `bio`: `String`
  - `displayName`: `String`
  - `followersCount`: `int`
  - `hideProfileFromMinors`: `bool`
  - `id`: `int`
  - `isBanned`: `bool`
  - `isBotAccount`: `bool`
  - `isParodyAccount`: `bool`
  - `isPrivate`: `bool`
  - `mutualFollowersCount`: `int`
  - `officialMark`: `List<String>`
  - `profileMaximumAge`: `Object?`
  - `profileMinimumAge`: `Object?`
  - `username`: `String`

## social.circles

- `circles`: `List<Object?>`

## social.lists

- `lists`: `List<Object?>`

## boards.list

- `boards`: `List<Object>`
  - `createdAt`: `DateTime`
  - `creator`: `Creator`
    - `displayName`: `String`
    - `id`: `int`
    - `username`: `String`
  - `description`: `String?`
  - `followed`: `bool`
  - `id`: `int`
  - `lastPostAt`: `DateTime`
  - `minimumAge`: `int`
  - `replyCount`: `int`
  - `slug`: `String`
  - `threadCount`: `int`
  - `title`: `String`

## boards.following

- `boards`: `List<Object?>`
- `threads`: `List<Object?>`

## boards.threads

- `board`: `Board`
  - `createdAt`: `DateTime`
  - `creator`: `Creator`
    - `displayName`: `String`
    - `id`: `int`
    - `username`: `String`
  - `description`: `String`
  - `followed`: `bool`
  - `id`: `int`
  - `lastPostAt`: `DateTime`
  - `minimumAge`: `int`
  - `replyCount`: `int`
  - `slug`: `String`
  - `threadCount`: `int`
  - `title`: `String`
- `threads`: `List<Object>`
  - `author`: `Author`
    - `avatarUrl`: `String`
    - `cardAccentColor`: `Object?`
    - `displayName`: `String`
    - `id`: `int`
    - `officialMark`: `List<Object?>`
    - `premiumBadgeColor`: `String`
    - `profileAccentColor`: `Object?`
    - `showCardDecoration`: `bool`
    - `showGreenBadge`: `bool`
    - `showPlusBadge`: `bool`
    - `showProBadge`: `bool`
    - `showProfileDecoration`: `bool`
    - `showRedBadge`: `bool`
    - `showSubscriptionBadges`: `bool`
    - `subscriptionActiveUntil`: `Object?`
    - `subscriptionBadgeColors`: `List<Object?>`
    - `subscriptionPlan`: `String`
    - `subscriptionStatus`: `String`
    - `username`: `String`
  - `authorId`: `int`
  - `boardId`: `int`
  - `content`: `String`
  - `createdAt`: `DateTime`
  - `followed`: `bool`
  - `id`: `int`
  - `imageTypes`: `List<Object?>`
  - `imageUrls`: `List<Object?>`
  - `lastReplyAt`: `DateTime`
  - `reactionSummary`: `List<Object?>`
  - `replyCount`: `int`
  - `title`: `String`
  - `updatedAt`: `DateTime`

## boards.replies

- `board`: `Board`
  - `createdAt`: `DateTime`
  - `creator`: `Creator`
    - `displayName`: `String`
    - `id`: `int`
    - `username`: `String`
  - `description`: `String`
  - `followed`: `bool`
  - `id`: `int`
  - `lastPostAt`: `DateTime`
  - `minimumAge`: `int`
  - `replyCount`: `int`
  - `slug`: `String`
  - `threadCount`: `int`
  - `title`: `String`
- `replies`: `List<Object>`
  - `author`: `Author`
    - `avatarUrl`: `String?`
    - `cardAccentColor`: `String?`
    - `displayName`: `String`
    - `id`: `int`
    - `officialMark`: `List<String>`
    - `premiumBadgeColor`: `String`
    - `profileAccentColor`: `String?`
    - `showCardDecoration`: `bool`
    - `showGreenBadge`: `bool`
    - `showPlusBadge`: `bool`
    - `showProBadge`: `bool`
    - `showProfileDecoration`: `bool`
    - `showRedBadge`: `bool`
    - `showSubscriptionBadges`: `bool`
    - `subscriptionActiveUntil`: `DateTime?`
    - `subscriptionBadgeColors`: `List<Object?>`
    - `subscriptionPlan`: `String`
    - `subscriptionStatus`: `String`
    - `username`: `String`
  - `authorId`: `int`
  - `boardId`: `int`
  - `content`: `String`
  - `createdAt`: `DateTime`
  - `id`: `int`
  - `imageTypes`: `List<Object?>`
  - `imageUrls`: `List<Object?>`
  - `reactionSummary`: `List<Object>`
    - `count`: `int`
    - `emoji`: `String`
    - `reacted`: `bool`
  - `replyNumber`: `int`
  - `threadId`: `int`
  - `updatedAt`: `DateTime`
- `thread`: `Thread`
  - `author`: `Author`
    - `avatarUrl`: `String`
    - `cardAccentColor`: `Object?`
    - `displayName`: `String`
    - `id`: `int`
    - `officialMark`: `List<Object?>`
    - `premiumBadgeColor`: `String`
    - `profileAccentColor`: `Object?`
    - `showCardDecoration`: `bool`
    - `showGreenBadge`: `bool`
    - `showPlusBadge`: `bool`
    - `showProBadge`: `bool`
    - `showProfileDecoration`: `bool`
    - `showRedBadge`: `bool`
    - `showSubscriptionBadges`: `bool`
    - `subscriptionActiveUntil`: `Object?`
    - `subscriptionBadgeColors`: `List<Object?>`
    - `subscriptionPlan`: `String`
    - `subscriptionStatus`: `String`
    - `username`: `String`
  - `authorId`: `int`
  - `boardId`: `int`
  - `content`: `String`
  - `createdAt`: `DateTime`
  - `followed`: `bool`
  - `id`: `int`
  - `imageTypes`: `List<Object?>`
  - `imageUrls`: `List<Object?>`
  - `lastReplyAt`: `DateTime`
  - `reactionSummary`: `List<Object?>`
  - `replyCount`: `int`
  - `title`: `String`
  - `updatedAt`: `DateTime`

## notifications.list

- `notifications`: `List<Object?>`
- `pagination`: `Pagination`
  - `hasMore`: `bool`
  - `limit`: `int`
  - `nextPage`: `Object?`
  - `page`: `int`

## notifications.unreadCount

- `count`: `int`

## dm.groups

- `groups`: `List<Object?>`
- `pagination`: `Pagination`
  - `hasNext`: `bool`
  - `limit`: `int`
  - `page`: `int`

## dm.unreadCount

- `count`: `int`

## search.users

- `pagination`: `Pagination`
  - `limit`: `int`
  - `page`: `int`
  - `pages`: `int`
  - `total`: `int`
- `users`: `List<Object>`
  - `avatarFrameId`: `Object?`
  - `avatarUrl`: `String`
  - `bio`: `String`
  - `displayName`: `String`
  - `follow_request_sent`: `bool`
  - `followersCount`: `int`
  - `followingCount`: `int`
  - `hideProfileFromMinors`: `bool`
  - `id`: `int`
  - `isBotAccount`: `bool`
  - `isParodyAccount`: `bool`
  - `isPrivate`: `bool`
  - `is_followed_by`: `bool`
  - `is_following`: `bool`
  - `officialMark`: `List<String>`
  - `profileMaximumAge`: `Object?`
  - `profileMinimumAge`: `int?`
  - `username`: `String`

## search.hashtags

- `hashtags`: `List<Object>`
  - `createdAt`: `DateTime`
  - `id`: `int`
  - `name`: `String`
  - `trendScore`: `int`
  - `updatedAt`: `DateTime`
  - `usageCount`: `int`
- `pagination`: `Pagination`
  - `limit`: `int`
  - `page`: `int`
  - `pages`: `int`
  - `total`: `int`

## search.trending

- `trends`: `List<Object>`
  - `authorCount`: `int`
  - `label`: `String`
  - `postCount`: `int`
  - `token`: `String`
  - `trendScore`: `double`
  - `type`: `String`
  - `usageCount`: `int`

## 取れなかったもの

| 対象 | 理由 |
| --- | --- |
| `dm.group` | この環境では埋められない値がある: dm/groups/{groupId} |
| `dm.messages` | この環境では埋められない値がある: dm/groups/{groupId}/messages?page=1&limit=20 |

