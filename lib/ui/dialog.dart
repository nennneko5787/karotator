import "package:flutter/material.dart";
import "package:karotator/exceptions.dart";

Future<void> showAlert(
  BuildContext context, {
  Object? e,
  String? title,
  String? content,
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
  } else {
    if ((title == null) && (content == null)) {
      title = "エラー";
      content =
          "ダイアログの表示がリクエストされましたが、内容が指定されていません\nこのアプリがPre-releaseでない場合、開発者に報告してください";
    }
  }

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('タイトルテキスト'),
        content: Text("コンテントテキスト"),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
