import "package:flutter/material.dart";
import "package:karotator/api/exceptions.dart";

/// 人に見せる 1 行のエラー文。
///
/// サーバーが理由を書いてくれている（`Proプラン限定のリアクションです` など）
/// ので、それをそのまま出す。無ければ型名に落とす。
String describeError(Object e) => switch (e) {
  KarotterException(:final String message) when message.isNotEmpty => message,
  _ => e.toString(),
};

/// 失敗しても画面を止めない操作の入れ物。
///
/// いいね・リアクション・投票のような「押しただけ」の操作は、失敗しても
/// 帯や画面ごと落とす必要がない。例外を投げっぱなしにするとデバッガが
/// 未処理例外で停止してアプリが固まるので、必ずここで受ける。
///
/// 戻り値は成功したかどうか。
Future<bool> runGuarded(
  BuildContext context,
  Future<void> Function() action,
) async {
  try {
    await action();
    return true;
  } catch (e, stackTrace) {
    debugPrint("$e\n$stackTrace");
    if (!context.mounted) return false;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(describeError(e))));
    return false;
  }
}

Future<void> showAlert(
  BuildContext context, {
  Object? e,
  String? title,
  String? content,
  void Function()? onOk,
}) async {
  if (e != null) {
    if ((title == null) && (content == null)) {
      if (e is KarotterClientException) {
        title = "Karotter クライアントエラー ${e.statusCode}";
        content = e.message;
      } else if (e is KarotterServerException) {
        title = "Karotter サーバーエラー ${e.statusCode}";
        content = e.message;
      } else {
        title = "エラー";
        content = e.toString();
      }
    }
  }

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title ?? "エラー"),
        content: Text(
          content ??
              "ダイアログの表示がリクエストされましたが、内容が指定されていません\nこのアプリがPre-releaseでない場合、開発者に報告してください",
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              if (onOk != null) {
                onOk();
              }
            },
          ),
        ],
      );
    },
  );
}
