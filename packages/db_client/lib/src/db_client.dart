import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_client/src/db_record.dart';
import 'package:flutter/material.dart';

class DbClient {
  final FirebaseFirestore _firestore;

  DbClient({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<String> add({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      final docRef = await _firestore.collection(collection).add(data);
      return docRef.id;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<List<DbRecord>> fetchAll() async {
    throw UnimplementedError();
  }
}
