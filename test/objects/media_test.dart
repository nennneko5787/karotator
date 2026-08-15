// 添付の種類。Karotter は画像・動画のほか音声も添付できる。
//
// `mediaTypes` は `image` / `video` / `audio` のことも MIME 型のこともあり、
// 欠けていることもある。判定規則の出典は `profile._username` チャンク。

import 'package:flutter_test/flutter_test.dart';
import 'package:karotator/objects/media.dart';

void main() {
  group('短い型名', () {
    test('image / video / audio', () {
      expect(mediaKindOf('/a', 'image'), MediaKind.image);
      expect(mediaKindOf('/a', 'video'), MediaKind.video);
      expect(mediaKindOf('/a', 'audio'), MediaKind.audio);
    });
  });

  group('MIME 型', () {
    test('接頭辞で判断する', () {
      expect(mediaKindOf('/a', 'image/png'), MediaKind.image);
      expect(mediaKindOf('/a', 'video/mp4'), MediaKind.video);
      expect(mediaKindOf('/a', 'audio/mpeg'), MediaKind.audio);
    });
  });

  group('型が無いとき', () {
    test('拡張子で判断する', () {
      expect(mediaKindOf('/a/b.mp4', null), MediaKind.video);
      expect(mediaKindOf('/a/b.webm', null), MediaKind.video);
      expect(mediaKindOf('/a/b.mp3', null), MediaKind.audio);
      expect(mediaKindOf('/a/b.m4a', null), MediaKind.audio);
      expect(mediaKindOf('/a/b.png', null), MediaKind.image);
    });

    test('クエリが付いていても効く', () {
      expect(mediaKindOf('/a/b.mp3?v=2', null), MediaKind.audio);
      expect(mediaKindOf('/a/b.mp4?v=2', null), MediaKind.video);
    });

    test('空文字の型は無いのと同じ', () {
      expect(mediaKindOf('/a/b.mp3', ''), MediaKind.audio);
    });

    test('判断できなければ画像として扱う', () {
      // 今までの挙動を変えない。
      expect(mediaKindOf('/a/b', null), MediaKind.image);
      expect(mediaKindOf('/a/b', 'application/octet-stream'), MediaKind.image);
    });
  });

  group('attachmentsOf', () {
    test('URL と型を組にする', () {
      final list = attachmentsOf(
        ['/a.png', '/b.mp4', '/c.mp3'],
        ['image', 'video', 'audio'],
      );
      expect(list.map((a) => a.kind), [
        MediaKind.image,
        MediaKind.video,
        MediaKind.audio,
      ]);
    });

    test('型の数が足りなくても落ちない', () {
      // 長さが揃わないことがある。足りない側は拡張子で判断する。
      final list = attachmentsOf(['/a.png', '/b.mp3'], ['image']);
      expect(list.length, 2);
      expect(list[1].kind, MediaKind.audio);
    });

    test('型が多くても落ちない', () {
      final list = attachmentsOf(['/a.png'], ['image', 'video']);
      expect(list.single.kind, MediaKind.image);
    });

    test('画像か動画があるかを判定できる', () {
      // プロフィールのメディア欄の絞り込み。`/users/{id}/media` は
      // メディアを持たないカロートも返すため、こちらで落とす。
      expect(hasVisualMedia(['/a.png'], ['image']), isTrue);
      expect(hasVisualMedia(['/a.mp4'], ['video']), isTrue);
      expect(hasVisualMedia([], []), isFalse);
    });

    test('音声だけの添付はメディア欄に出さない', () {
      // Web も画像/動画だけを数えている。
      expect(hasVisualMedia(['/a.mp3'], ['audio']), isFalse);
      expect(hasVisualMedia(['/a.mp3', '/b.png'], ['audio', 'image']), isTrue);
    });

    test('音声とそれ以外を分けられる', () {
      final list = attachmentsOf(
        ['/a.png', '/b.mp3', '/c.mp4'],
        ['image', 'audio', 'video'],
      );
      expect(list.where((a) => a.isAudio).length, 1);
      expect(list.where((a) => !a.isAudio).length, 2);
    });
  });
}
