import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../insfrastructure/infrastructure.dart';

export '../models/models.dart';
export '../utils/utils.dart';
export './../services/services.dart';

abstract class Domain<T> {
  FirestoreRepository repository = FirestoreRepository<T>();

  final uuid = Uuid();

  String get uidV1 => uuid.v1();

  String get currentUserUid => repository.currentUser;

  @mustCallSuper
  void clearPagination() => repository.clearPagination();
}
