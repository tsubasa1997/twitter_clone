import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/repository/auth_repository.dart';

final authUserProvider = StreamProvider.autoDispose<String?>(
  (ref) => ref.watch(authRepositoryProvider).uid(),
);
