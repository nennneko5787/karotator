// 相対パスの絶対化。
//
// API は基本 `/uploads/...` の相対パスを返すが、外部認証のアバターなど
// 絶対 URL が混ざることがある。素で連結すると `karotter.comhttps://...`
// という不正なホスト名になり、`Failed host lookup` で画像が出なくなる。

import 'package:flutter_test/flutter_test.dart';
import 'package:karotator/const.dart';

void main() {
  group('karotterUrl', () {
    test('相対パスにホストを足す', () {
      expect(karotterUrl('/uploads/a.png'), 'https://karotter.com/uploads/a.png');
    });

    test('先頭の / が無くても足す', () {
      expect(karotterUrl('uploads/a.png'), 'https://karotter.com/uploads/a.png');
    });

    test('絶対 URL はそのまま返す', () {
      // ここが壊れていた。連結すると karotter.comhttps://... になる。
      const absolute = 'https://lh3.googleusercontent.com/a/abc123';
      expect(karotterUrl(absolute), absolute);
      expect(karotterUrl('http://example.com/a.png'), 'http://example.com/a.png');
    });

    test('プロトコル相対には https を補う', () {
      expect(karotterUrl('//cdn.example.com/a.png'), 'https://cdn.example.com/a.png');
    });

    test('空文字はホストだけ', () {
      expect(karotterUrl(''), 'https://karotter.com');
    });
  });

  group('avatarUrlOf', () {
    test('未設定なら既定アイコン', () {
      expect(avatarUrlOf(null), 'https://karotter.com/default-avatar.png');
    });

    test('絶対 URL のアバターもそのまま', () {
      const absolute = 'https://cdn.discordapp.com/avatars/1/2.png';
      expect(avatarUrlOf(absolute), absolute);
    });
  });
}
