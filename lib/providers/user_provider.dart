// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:twitter_clone/models/user.dart';
// import 'package:twitter_clone/repositorice/user_repository.dart';
//
// final userProvider = StreamProvider.autoDispose.family<User, String>(
//     (ref, userId) => ref.watch(userRepositoryProvider).listenUser(userId),
// );