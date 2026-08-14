import 'package:karotator/api/endpoints/posts.dart';
import 'package:karotator/api/endpoints/users.dart';
import 'package:karotator/api/karotter_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api.g.dart';

/// カロート関連のエンドポイント。
///
/// プロバイダ越しに取るのは、テストで差し替えられるようにするため。
/// 直接 `KarotterApi().posts` を掴むと通信を伴わない検証ができない。
@riverpod
PostsApi postsApi(Ref ref) => KarotterApi().posts;

/// ユーザー関連のエンドポイント。理由は [postsApi] と同じ。
@riverpod
UsersApi usersApi(Ref ref) => KarotterApi().users;
