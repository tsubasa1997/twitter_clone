import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_info.dart';
import '../repository/follow_repository.dart';

final searchUserProvider =
FutureProvider.family<List<UserInfo>, String>((ref, userName) async {
  return ref.watch(usersRepositoryProvider).searchUsers(userName: userName);
});