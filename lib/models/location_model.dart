import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  final String id;
  final String name;
  final String category;
  final String description;
  final double latitude;
  final double longitude;
  final String address;
  final String createdBy;
  final DateTime timestamp;

  LocationModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.createdBy,
    required this.timestamp,
  });

  factory LocationModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return LocationModel(
      id: doc.id,
      name: data['name'] ?? '',
      category: data['category'] ?? '',
      description: data['description'] ?? '',
      latitude: data['latitude']?.toDouble() ?? 0.0,
      longitude: data['longitude']?.toDouble() ?? 0.0,
      address: data['address'] ?? '',
      createdBy: data['createdBy'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'createdBy': createdBy,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
