import 'package:flutter/material.dart';

class DirectoryScreenDemo extends StatefulWidget {
  const DirectoryScreenDemo({super.key});

  @override
  State<DirectoryScreenDemo> createState() => _DirectoryScreenDemoState();
}

class _DirectoryScreenDemoState extends State<DirectoryScreenDemo> {
  String _searchQuery = '';
  String _selectedCategory = 'All';

  final _demoLocations = [
    {'name': 'Kigali Convention Centre', 'category': 'Tourist Attraction', 'address': 'KN 3 Ave, Kigali'},
    {'name': 'King Faisal Hospital', 'category': 'Hospital', 'address': 'KN 4 Ave, Kigali'},
    {'name': 'Green Hills Academy', 'category': 'School', 'address': 'Nyarutarama, Kigali'},
    {'name': 'Heaven Restaurant', 'category': 'Restaurant', 'address': 'KG 7 Ave, Kigali'},
    {'name': 'Kigali Marriott Hotel', 'category': 'Hotel', 'address': 'KN 3 Ave, Kigali'},
    {'name': 'Inema Arts Center', 'category': 'Tourist Attraction', 'address': 'KG 563 St, Kigali'},
  ];

  List<Map<String, String>> get _filteredLocations {
    return _demoLocations.where((loc) {
      final matchesSearch = loc['name']!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          loc['category']!.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'All' || loc['category'] == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Hospital', 'School', 'Restaurant', 'Hotel', 'Tourist Attraction'];

    return Scaffold(
      appBar: AppBar(title: const Text('Kigali Directory')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search locations...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(categories[index]),
                    selected: _selectedCategory == categories[index],
                    onSelected: (_) => setState(() => _selectedCategory = categories[index]),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: _filteredLocations.isEmpty
                ? const Center(child: Text('No locations found'))
                : ListView.builder(
                    itemCount: _filteredLocations.length,
                    itemBuilder: (context, index) {
                      final location = _filteredLocations[index];
                      return ListTile(
                        title: Text(location['name']!),
                        subtitle: Text('${location['category']} • ${location['address']}'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Viewing ${location['name']}')),
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
