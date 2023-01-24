import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../repository/user_repository.dart';

final userFollowerProvider = StreamProvider.autoDispose.family<User, String>(
  (ref, userId) => ref.watch(homeRepositoryProvider).listenUserFollower(userId),
);
