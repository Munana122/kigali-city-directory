import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/location_model.dart';

class LocationDetailScreen extends StatelessWidget {
  final LocationModel location;
  const LocationDetailScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(location.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(location.latitude, location.longitude),
                  zoom: 15,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId(location.id),
                    position: LatLng(location.latitude, location.longitude),
                    infoWindow: InfoWindow(title: location.name),
                  ),
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(location.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Chip(label: Text(location.category)),
                  const SizedBox(height: 16),
                  const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(location.description),
                  const SizedBox(height: 16),
                  const Text('Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(location.address),
                  const SizedBox(height: 16),
                  const Text('Coordinates', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Lat: ${location.latitude}, Lng: ${location.longitude}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
