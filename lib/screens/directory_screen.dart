import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/location_provider.dart';
import '../models/location_model.dart';
import 'location_detail_screen.dart';

class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Hospital', 'School', 'Restaurant', 'Hotel', 'Cafe Park', 'Tourist Attraction'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kigali City', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      body: Column(
        children: [
          // Category Selectors
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Consumer<LocationProvider>(
                    builder: (context, provider, _) {
                      final isSelected = provider.selectedCategory == categories[index];
                      return ChoiceChip(
                        label: Text(categories[index]),
                        selected: isSelected,
                        selectedColor: const Color(0xFFFFB703),
                        labelStyle: TextStyle(color: isSelected ? Colors.black : Colors.white),
                        backgroundColor: const Color(0xFF1B263B),
                        onSelected: (_) => provider.setCategory(categories[index]),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for a service',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: const Icon(Icons.mic, color: Colors.grey),
                filled: true,
                fillColor: Colors.white.withOpacity(0.05),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              onChanged: (value) => context.read<LocationProvider>().setSearchQuery(value),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Near You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),

          // Location List
          Expanded(
            child: Consumer<LocationProvider>(
              builder: (context, provider, _) {
                return StreamBuilder<List<LocationModel>>(
                  stream: provider.getFilteredLocations(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                    final locations = snapshot.data!;
                    if (locations.isEmpty) return const Center(child: Text('No locations found'));
                    return ListView.builder(
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        final location = locations[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1B263B),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            title: Text(location.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: List.generate(5, (i) => Icon(Icons.star, size: 16, color: i < 4 ? const Color(0xFFFFB703) : Colors.grey)),
                                ),
                                const SizedBox(height: 4),
                                Text(location.address, style: const TextStyle(color: Colors.grey)),
                              ],
                            ),
                            trailing: Text('${(index + 1) * 0.5} km', style: const TextStyle(color: Colors.grey)),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => LocationDetailScreen(location: location)),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
