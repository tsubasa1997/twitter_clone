

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreDatasourceProvider = Provider((_) => FirestoreDatasource(),);

class FirestoreDatasource {
  final _db = FirebaseFirestore.instance;

  static const usersCollectionId = 'users';
  static const postsCollectionId = 'posts';

}