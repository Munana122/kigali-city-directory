import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import '../providers/location_provider.dart';
import '../models/location_model.dart';
import 'location_detail_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    await Geolocator.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map View')),
      body: Consumer<LocationProvider>(
        builder: (context, provider, _) {
          return StreamBuilder<List<LocationModel>>(
            stream: provider.getFilteredLocations(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
              final locations = snapshot.data!;
              final markers = locations.map((location) {
                return Marker(
                  markerId: MarkerId(location.id),
                  position: LatLng(location.latitude, location.longitude),
                  infoWindow: InfoWindow(title: location.name, snippet: location.category),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LocationDetailScreen(location: location)),
                  ),
                );
              }).toSet();

              return GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-1.9441, 30.0619),
                  zoom: 12,
                ),
                markers: markers,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (controller) => _mapController = controller,
              );
            },
          );
        },
      ),
    );
  }
}
