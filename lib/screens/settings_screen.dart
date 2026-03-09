import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../services/seed_data.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _isSeeding = false;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: Text(user?.email ?? 'Not logged in'),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Preferences', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text('Receive updates about new locations'),
            value: _notificationsEnabled,
            onChanged: (value) => setState(() => _notificationsEnabled = value),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Admin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.add_location),
            title: const Text('Seed Demo Locations'),
            subtitle: const Text('Add 6 sample locations to database'),
            trailing: _isSeeding ? const CircularProgressIndicator() : null,
            onTap: _isSeeding ? null : () async {
              setState(() => _isSeeding = true);
              try {
                await SeedData.seedLocations();
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Demo locations added!')),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                }
              } finally {
                if (mounted) setState(() => _isSeeding = false);
              }
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              await context.read<AuthProvider>().signOut();
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
