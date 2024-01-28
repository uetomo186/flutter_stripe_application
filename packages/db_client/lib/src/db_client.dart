import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_client/src/db_record.dart';

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
    } catch (err) {
      throw Exception('Error fetching documents: $err');
    }
  }

  Future<List<DbRecord>> fetchAll({
    required String collection,
  }) async {
    try {
      final colRef = _firestore.collection(collection);
      final documnts = await colRef.get();
      return documnts.docs
          .map((doc) => DbRecord(id: doc.id, data: doc.data()))
          .toList();
    } catch (err) {
      throw Exception('Error fetching documents: $err');
    }
  }
}
