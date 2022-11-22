import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/users.dart';
import '../../../repository/users_repository.dart';

final usersProvider = StreamProvider.autoDispose.family<Users, String>(
      (ref, userId) => ref.watch(usersRepositoryProvider).allUsers(),
);