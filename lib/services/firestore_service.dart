import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/location_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<LocationModel>> getLocations() {
    return _db.collection('locations').orderBy('timestamp', descending: true).snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => LocationModel.fromFirestore(doc)).toList(),
    );
  }

  Future<void> addLocation(LocationModel location) async {
    await _db.collection('locations').add(location.toMap());
  }

  Future<void> updateLocation(LocationModel location) async {
    await _db.collection('locations').doc(location.id).update(location.toMap());
  }

  Future<void> deleteLocation(String id) async {
    await _db.collection('locations').doc(id).delete();
  }

  Stream<List<LocationModel>> searchLocations(String query) {
    return _db.collection('locations').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => LocationModel.fromFirestore(doc))
          .where((location) =>
              location.name.toLowerCase().contains(query.toLowerCase()) ||
              location.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Stream<List<LocationModel>> filterByCategory(String category) {
    return _db.collection('locations').where('category', isEqualTo: category).snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => LocationModel.fromFirestore(doc)).toList(),
    );
  }
}
