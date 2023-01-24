import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../repository/auth_repository.dart';

final authLoginUserProvider = StreamProvider.autoDispose.family<User?, String>(
  (ref, uid) => ref.watch(authRepositoryProvider).listenLoginUser(uid),
);
