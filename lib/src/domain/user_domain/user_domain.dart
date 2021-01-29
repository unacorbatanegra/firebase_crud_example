import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain.dart';

class UserDomain extends Domain<User> {
  DocumentSnapshot lastDocument;
  int lastLength;

  @override
  Future<List<User>> getList({
    int limit = 20,
    bool startAfterTheLastDocument = false,
  }) =>
      repository.getList(
        (_) => User.fromJson(_),
        Collections.users,
        limit: limit,
        startAfterTheLastDocument: startAfterTheLastDocument,
        orderBy: 'user',
      );

  Future<User> get(String key) async {
    final user = await repository.get(
      (_) => User.fromJson(_),
      Collections.users,
      key,
    );

    return user;
  }

  Future<bool> checkExistUser(String uuid) async {
    final collection = repository.getFromCollection(Collections.users);
    final doc = await collection.doc(uuid).get();
    return doc.exists;
  }

  Future<void> put(User user) async {
    return await repository.put(
      data: user.toJson(),
      collection: Collections.users,
      uuid: user.uid,
    );
  }

  Future<void> updateUnit(
    String uid,
    Map<String, dynamic> data,
  ) =>
      repository.update(
        data: data,
        collection: Collections.users,
        uuid: uid,
      );

  @override
  void clearPagination() {
    lastDocument = null;
    lastLength = null;
    super.clearPagination();
  }
}
