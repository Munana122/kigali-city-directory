import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/location_provider.dart';
import '../providers/auth_provider.dart';
import '../models/location_model.dart';
import 'add_edit_location_screen.dart';
import 'location_detail_screen.dart';

class MyListingsScreen extends StatelessWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.watch<AuthProvider>().user?.uid ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text('My Listings')),
      body: Consumer<LocationProvider>(
        builder: (context, provider, _) {
          return StreamBuilder<List<LocationModel>>(
            stream: provider.getFilteredLocations(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
              final myLocations = snapshot.data!.where((l) => l.createdBy == userId).toList();
              if (myLocations.isEmpty) return const Center(child: Text('No listings yet'));
              return ListView.builder(
                itemCount: myLocations.length,
                itemBuilder: (context, index) {
                  final location = myLocations[index];
                  return ListTile(
                    title: Text(location.name),
                    subtitle: Text(location.category),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddEditLocationScreen(location: location))),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete'),
                                content: const Text('Delete this location?'),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                                  TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete')),
                                ],
                              ),
                            );
                            if (confirm == true) await provider.deleteLocation(location.id);
                          },
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LocationDetailScreen(location: location))),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddEditLocationScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
