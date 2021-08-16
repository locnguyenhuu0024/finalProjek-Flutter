//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FireStoreService{
  FireStoreService._();
  static final instance = FireStoreService._();
  Future<void> setData({String path, Map<dynamic, dynamic> data}) async {
    final CollectionReference optionCollection = FirebaseFirestore.instance.collection('admin');
    await optionCollection.doc().set(data);
  }

  Future<void> deleteData({@required String path}) async {
    final reference = FirebaseFirestore.instance.doc((path));
    print('delete: $path');
    await reference.delete();
  }

  Stream<List<T>> collectionStream<T>({
    @required String path,
    @required T Function(Map<String, dynamic> data, String documentID) builder,
  }) {
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshots) =>
        snapshots.docs.map((snapshot) => builder(snapshot.data(), snapshot.id),).toList());
  }
}