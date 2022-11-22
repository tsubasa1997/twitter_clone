import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import '../../../models/users.dart';
import '../../../repository/users_repository.dart';

part 'users_controller.freezed.dart';


final usersStateProvider =
StateNotifierProvider<UsersStateNotifier, UsersState>(
      (ref) => UsersStateNotifier(ref: ref),
);

@freezed
class UsersState with _$UsersState {
  const factory UsersState({
    String? id,
    String? name,
  }) = _UsersState;
}

class UsersStateNotifier extends StateNotifier<UsersState> {
  UsersStateNotifier({required this.ref}) : super(const UsersState());
  final Ref ref;

  UsersRepository get _repository => ref.read(usersRepositoryProvider);

  List<Users> accounts = [];

  Future<void> fetchUsers() async {
  }

}