
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user.dart';
import '../../../repository/home_repository.dart';

final homeProvider = StreamProvider.autoDispose.family<User, String>(
      (ref, userId) => ref.watch(homeRepositoryProvider).listenUser(userId),
);