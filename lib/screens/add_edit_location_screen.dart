import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/location_provider.dart';
import '../providers/auth_provider.dart';
import '../models/location_model.dart';

class AddEditLocationScreen extends StatefulWidget {
  final LocationModel? location;
  const AddEditLocationScreen({super.key, this.location});

  @override
  State<AddEditLocationScreen> createState() => _AddEditLocationScreenState();
}

class _AddEditLocationScreenState extends State<AddEditLocationScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _addressController;
  late TextEditingController _latController;
  late TextEditingController _lngController;
  String _category = 'Hospital';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.location?.name);
    _descController = TextEditingController(text: widget.location?.description);
    _addressController = TextEditingController(text: widget.location?.address);
    _latController = TextEditingController(text: widget.location?.latitude.toString() ?? '-1.9441');
    _lngController = TextEditingController(text: widget.location?.longitude.toString() ?? '30.0619');
    _category = widget.location?.category ?? 'Hospital';
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['Hospital', 'School', 'Restaurant', 'Hotel', 'Cafe Park', 'Tourist Attraction'];

    return Scaffold(
      appBar: AppBar(title: Text(widget.location == null ? 'Add Location' : 'Edit Location')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _category,
              decoration: const InputDecoration(labelText: 'Category'),
              items: categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => _category = v!),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _latController,
              decoration: const InputDecoration(labelText: 'Latitude'),
              keyboardType: TextInputType.number,
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _lngController,
              decoration: const InputDecoration(labelText: 'Longitude'),
              keyboardType: TextInputType.number,
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final userId = context.read<AuthProvider>().user?.uid ?? '';
                  final location = LocationModel(
                    id: widget.location?.id ?? '',
                    name: _nameController.text,
                    category: _category,
                    description: _descController.text,
                    latitude: double.parse(_latController.text),
                    longitude: double.parse(_lngController.text),
                    address: _addressController.text,
                    createdBy: userId,
                    timestamp: DateTime.now(),
                  );
                  if (widget.location == null) {
                    await context.read<LocationProvider>().addLocation(location);
                  } else {
                    await context.read<LocationProvider>().updateLocation(location);
                  }
                  if (mounted) Navigator.pop(context);
                }
              },
              child: Text(widget.location == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
