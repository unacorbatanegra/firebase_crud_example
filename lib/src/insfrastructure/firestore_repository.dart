import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

typedef FromJson<T> = T Function(dynamic json);

class FirestoreRepository<T> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final _storage = FirebaseStorage.instance.ref();
  final _auth = FirebaseAuth.instance;

  DocumentSnapshot lastDocument;
  int lastLength;
  String lastCollection;

  String get currentUser => _auth.currentUser?.uid;

  Future<void> put({
    @required Map<String, dynamic> data,
    @required String collection,
    @required String uuid,
  }) =>
      db.collection(collection).doc(uuid).set(
            data,
            SetOptions(merge: true),
          );

  Future<void> update({
    @required Map<String, dynamic> data,
    @required String collection,
    @required String uuid,
  }) =>
      db.collection(collection).doc(uuid).update(
            data,
          );

  Future<List<T>> getList<T>(
    FromJson<T> fromJson,
    String collection, {
    int limit = 20,
    @required bool startAfterTheLastDocument,
    dynamic orderBy,
    bool descendent = false,
  }) async {
    final list = <T>[];
    if (lastLength != null &&
        lastLength % limit != 0 &&
        collection == (lastCollection ?? '')) return list;

    final cF = orderBy != null
        ? db
            .collection(collection)
            .limit(limit)
            .orderBy(orderBy, descending: descendent)
        : db.collection(collection).limit(limit);
        
    final ref = startAfterTheLastDocument && lastDocument != null
        ? await cF.startAfterDocument(lastDocument).get()
        : await cF.get();

    if (ref.docs.isNotEmpty) {
      list.addAll(ref.docs.map((e) => fromJson(e)));
      lastDocument = ref.docs.last;
      lastCollection = collection;
      lastLength = ref.docs.length;
    }
    return list;
  }

  List<T> getFromDocuments<T>(
          FromJson<T> fromJson, List<QueryDocumentSnapshot> documents) =>
      documents.map((e) => fromJson(e)).toList();

  CollectionReference getFromCollection(String collection) =>
      db.collection(collection);

  Future<T> get<T>(
    FromJson<T> fromJson,
    String collection,
    String uuid,
  ) async {
    final ref = await db.collection(collection).doc(uuid).get();
    return ref.data() != null ? fromJson(ref.data()) : null;
  }

  Future<void> delete({
    @required String uuid,
    @required String collection,
  }) =>
      db.collection(collection).doc(uuid).delete();

  Future<String> uploadFile(String path, File file) async {
    final result = _storage.child(path).putFile(file);
    final snapshot = await result.whenComplete(
      () => null,
    );
    return await snapshot.ref.getDownloadURL();
  }

  UploadTask uploadFileTask(String path, File file) {
    print(path);
    return _storage.child(path).putFile(file);
  }

  Future<void> deleteStorage(String url) async {
    try {
      print(url);
      final reference = FirebaseStorage.instance.refFromURL(url);
      await reference.delete();
    } on PlatformException catch (e) {
      print('${e.message}+${e.details}+${e.code}');
    }
  }

  void clearPagination() {
    lastDocument = null;
    lastCollection = null;
    lastLength = null;
  }
}
