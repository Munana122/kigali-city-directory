import 'package:cloud_firestore/cloud_firestore.dart';

class SeedData {
  static Future<void> seedLocations() async {
    final db = FirebaseFirestore.instance;
    
    final locations = [
      {'name': 'Kigali Convention Centre', 'category': 'Tourist Attraction', 'description': 'Modern convention center', 'address': 'KN 3 Ave, Kigali', 'latitude': -1.9536, 'longitude': 30.0927, 'createdBy': 'admin', 'timestamp': Timestamp.now()},
      {'name': 'King Faisal Hospital', 'category': 'Hospital', 'description': 'Major hospital in Kigali', 'address': 'KN 4 Ave, Kigali', 'latitude': -1.9659, 'longitude': 30.0946, 'createdBy': 'admin', 'timestamp': Timestamp.now()},
      {'name': 'Green Hills Academy', 'category': 'School', 'description': 'International school', 'address': 'Nyarutarama, Kigali', 'latitude': -1.9403, 'longitude': 30.1261, 'createdBy': 'admin', 'timestamp': Timestamp.now()},
      {'name': 'Heaven Restaurant', 'category': 'Restaurant', 'description': 'Popular restaurant', 'address': 'KG 7 Ave, Kigali', 'latitude': -1.9536, 'longitude': 30.0606, 'createdBy': 'admin', 'timestamp': Timestamp.now()},
      {'name': 'Kigali Marriott Hotel', 'category': 'Hotel', 'description': 'Luxury hotel', 'address': 'KN 3 Ave, Kigali', 'latitude': -1.9536, 'longitude': 30.0619, 'createdBy': 'admin', 'timestamp': Timestamp.now()},
      {'name': 'Inema Arts Center', 'category': 'Tourist Attraction', 'description': 'Art gallery and studio', 'address': 'KG 563 St, Kigali', 'latitude': -1.9441, 'longitude': 30.0894, 'createdBy': 'admin', 'timestamp': Timestamp.now()},
    ];

    for (var location in locations) {
      await db.collection('locations').add(location);
    }
  }
}
