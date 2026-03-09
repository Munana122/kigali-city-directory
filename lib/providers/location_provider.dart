import 'package:flutter/material.dart';
import '../models/location_model.dart';
import '../services/firestore_service.dart';

class LocationProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<LocationModel> _locations = [];
  String _searchQuery = '';
  String _selectedCategory = 'All';

  List<LocationModel> get locations => _locations;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Stream<List<LocationModel>> getFilteredLocations() {
    if (_searchQuery.isNotEmpty) {
      return _firestoreService.searchLocations(_searchQuery);
    } else if (_selectedCategory != 'All') {
      return _firestoreService.filterByCategory(_selectedCategory);
    }
    return _firestoreService.getLocations();
  }

  Future<void> addLocation(LocationModel location) async {
    await _firestoreService.addLocation(location);
  }

  Future<void> updateLocation(LocationModel location) async {
    await _firestoreService.updateLocation(location);
  }

  Future<void> deleteLocation(String id) async {
    await _firestoreService.deleteLocation(id);
  }
}
