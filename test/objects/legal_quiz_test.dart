// 規約クイズのモデルと通知の遷移先。
//
// 仕様: specs/004-posting-restrictions/design.md §11

import 'package:flutter_test/flutter_test.dart';
import 'package:karotator/enum.dart';
import 'package:karotator/objects/legal_documents.dart';
import 'package:karotator/objects/legal_quiz.dart';
import 'package:karotator/objects/notification.dart';
import 'package:karotator/objects/notification_target.dart';
import 'package:karotator/objects/user.dart';

Notification _notification({
  NotificationType type = NotificationType.SYSTEM,
  String? message,
  String? route,
}) => Notification(
  actor: Author.empty(),
  actorCount: 1,
  actorId: 1,
  actors: const [],
  createdAt: DateTime(2026),
  groupKey: 'g',
  id: 1,
  isRead: false,
  likeContext: NotificationContext.OTHER,
  message: message,
  route: route,
  notificationIds: const [1],
  postCount: 0,
  posts: const [],
  rekarotContext: NotificationContext.OTHER,
  type: type,
  userId: 1,
);

void main() {
  group('LegalQuiz のパース', () {
    test('観測した形を読める', () {
      // 実際の応答から 1 問だけ抜いたもの。
      // **id は数値ではなく文字列**。設問はスラグ、選択肢は 16 進。
      final quiz = LegalQuiz.fromJson({
        'token': '_46WwtkDa0UtSe59.CiT19...',
        'expiresInSeconds': 900,
        'requiredCorrectAnswers': 5,
        'questions': [
          {
            'id': 'privacy-minors-careful',
            'document': {'ja': 'プライバシーポリシー', 'en': 'Privacy Policy'},
            'documentPath': '/privacy',
            'prompt': {
              'ja': '未成年者に関する情報の取扱いについて正しいものは？',
              'en': 'Which statement about minors’ information is correct?',
            },
            'options': [
              {
                'id': 'c15e08d3385c0822',
                'label': {'ja': '未成年者の年齢情報は、必ず公開プロフィールに表示する', 'en': '...'},
              },
              {
                'id': '44d737c952ca9967',
                'label': {'ja': '情報の性質をふまえ、通常よりも特に慎重に取り扱う', 'en': '...'},
              },
            ],
          },
        ],
      });

      expect(quiz.expiresInSeconds, 900);
      expect(quiz.requiredCorrectAnswers, 5);
      expect(quiz.questions.single.id, 'privacy-minors-careful');
      expect(quiz.questions.single.prompt.text, '未成年者に関する情報の取扱いについて正しいものは？');
      expect(quiz.questions.single.documentPath, '/privacy');
      expect(quiz.questions.single.options.first.id, 'c15e08d3385c0822');
    });

    test('documentPath は legalDocuments の path と一致する', () {
      // 一致しないとクイズから規約本文へ飛べない (REQ-GATE-013)。
      const observed = [
        '/privacy',
        '/api-bot-terms',
        '/terms',
      ];
      for (final path in observed) {
        expect(
          legalDocuments.any((doc) => doc.path == path),
          isTrue,
          reason: '$path に対応する規約が legalDocuments に無い',
        );
      }
    });

    test('設問が 0 件でも落ちない', () {
      // 設問数を数え打ちしない (REQ-GATE-023)。
      expect(LegalQuiz.fromJson(const {}).questions, isEmpty);
      expect(LegalQuiz.fromJson(const {'questions': []}).token, '');
    });

    test('ja が無ければ en に落ちる', () {
      expect(LocalizedText.fromJson(const {'en': 'Only English'}).text,
          'Only English');
    });
  });

  group('採点結果', () {
    final result = LegalQuizResult.fromJson({
      'passed': true,
      'legalQuizPassed': true,
      'questions': [
        {
          'id': 'privacy-minors-careful',
          'options': [
            {
              'id': 'c15e08d3385c0822',
              'explanation': {'ja': 'これが正解', 'en': ''},
              'isCorrect': true,
              'isSelected': true,
            },
            {
              'id': '44d737c952ca9967',
              'explanation': {'ja': 'これは違う', 'en': ''},
              'isCorrect': false,
              'isSelected': false,
            },
          ],
        },
      ],
    });

    test('設問 ID と選択肢 ID で引ける', () {
      expect(result.byOption['privacy-minors-careful:c15e08d3385c0822']?.isCorrect, isTrue);
      expect(result.byOption['privacy-minors-careful:c15e08d3385c0822']?.explanation.text, 'これが正解');
      expect(result.byOption['privacy-minors-careful:44d737c952ca9967']?.isCorrect, isFalse);
      expect(result.byOption['privacy-minors-careful:unknown'], isNull);
    });

    test('passed と legalQuizPassed は別物', () {
      // 未ログインだと合格しても記録されない。控えを更新してはいけない。
      final notRecorded = LegalQuizResult.fromJson(const {
        'passed': true,
        'legalQuizPassed': false,
      });
      expect(notRecorded.passed, isTrue);
      expect(notRecorded.legalQuizPassed, isFalse);
    });

    test('欠けていても既定値で読める', () {
      final empty = LegalQuizResult.fromJson(const {});
      expect(empty.passed, isFalse);
      expect(empty.legalQuizPassed, isFalse);
      expect(empty.byOption, isEmpty);
    });
  });

  group('SYSTEM 通知のパース', () {
    // 実際に届いたもの。行為者がいないので actor / actorId が null で来る。
    // これが読めないと通知一覧のレスポンス全体が落ちる。
    const observed = {
      'id': 6288341,
      'groupKey': 'SYSTEM:none:2026-08-15T10:39:48.971Z',
      'type': 'SYSTEM',
      'message':
          'まだメール認証が完了していないため投稿できません。設定 → アカウントからメールアドレスを認証し、'
          'そのあと規約クイズ（https://karotter.com/legal-quiz）に1回合格すると投稿できるようになります。',
      'userId': 42128,
      'actorId': null,
      'actor': null,
      'actors': <Object?>[],
      'actorCount': 0,
      'postId': null,
      'post': null,
      'communityId': null,
      'community': null,
      'subscriptionGiftId': null,
      'posts': <Object?>[],
      'postCount': 0,
      'likeContext': 'OTHER',
      'rekarotContext': 'OTHER',
      'reactionEmojis': <Object?>[],
      'isRead': false,
      'createdAt': '2026-08-15T10:39:48.971Z',
      'notificationIds': [6288341],
    };

    test('actor が null でも読める', () {
      final notification = Notification.fromJson(observed);
      expect(notification.actor, isNull);
      expect(notification.actorId, isNull);
      expect(notification.type, NotificationType.SYSTEM);
      expect(notification.userId, 42128);
    });

    test('route が無くても本文から行き先が決まる', () {
      // 観測した SYSTEM 通知に route は含まれていなかった。
      final notification = Notification.fromJson(observed);
      expect(notification.route, isNull);
      expect(
        systemNotificationTarget(notification),
        SystemNotificationTarget.accountSettings,
      );
    });

    test('必須項目が欠けていても既定値で読める', () {
      final minimal = Notification.fromJson(const {
        'id': 1,
        'createdAt': '2026-08-15T10:39:48.971Z',
      });
      expect(minimal.actors, isEmpty);
      expect(minimal.posts, isEmpty);
      expect(minimal.notificationIds, isEmpty);
      expect(minimal.actorCount, 0);
      expect(minimal.isRead, isFalse);
      expect(minimal.type, NotificationType.UNKNOWN);
      expect(minimal.likeContext, NotificationContext.UNKNOWN);
    });
  });

  group('通知の遷移先', () {
    test('route があればそれを優先する', () {
      expect(
        systemNotificationTarget(_notification(route: '/legal-quiz')),
        SystemNotificationTarget.legalQuiz,
      );
      expect(
        systemNotificationTarget(_notification(route: '/settings?tab=accounts')),
        SystemNotificationTarget.accountSettings,
      );
    });

    test('route が無ければ本文の前方一致に落ちる', () {
      expect(
        systemNotificationTarget(
          _notification(message: '規約クイズにまだ合格していないため投稿できません。'),
        ),
        SystemNotificationTarget.legalQuiz,
      );
      expect(
        systemNotificationTarget(
          _notification(message: 'まだメール認証が完了していないため投稿できません。'),
        ),
        SystemNotificationTarget.accountSettings,
      );
    });

    test('protocol-relative な route は弾く', () {
      // `//evil.example` は外部 URL になりうる。
      expect(
        systemNotificationTarget(
          _notification(route: '//evil.example', message: '規約クイズにまだ合格していないため投稿できません。'),
        ),
        SystemNotificationTarget.legalQuiz,
      );
      expect(
        systemNotificationTarget(_notification(route: '//evil.example')),
        isNull,
      );
    });

    test('知らない route は null', () {
      expect(systemNotificationTarget(_notification(route: '/ranking')), isNull);
    });

    test('SYSTEM 以外は前方一致を見ない', () {
      expect(
        systemNotificationTarget(
          _notification(
            type: NotificationType.LIKE,
            message: '規約クイズにまだ合格していないため投稿できません。',
          ),
        ),
        isNull,
      );
    });

    test('関係のない通知は null', () {
      expect(systemNotificationTarget(_notification(message: 'こんにちは')), isNull);
      expect(systemNotificationTarget(_notification()), isNull);
    });
  });
}
