import 'package:flutter/material.dart';
import 'directory_screen_demo.dart';

class HomeScreenDemo extends StatefulWidget {
  const HomeScreenDemo({super.key});

  @override
  State<HomeScreenDemo> createState() => _HomeScreenDemoState();
}

class _HomeScreenDemoState extends State<HomeScreenDemo> {
  int _currentIndex = 0;

  final _screens = [
    const DirectoryScreenDemo(),
    const DemoScreen(title: 'My Listings', icon: Icons.list),
    const DemoScreen(title: 'Map View', icon: Icons.map),
    const DemoScreen(title: 'Settings', icon: Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Directory'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'My Listings'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class DemoScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  const DemoScreen({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            const Text('Setup Firebase to enable this feature'),
          ],
        ),
      ),
    );
  }
}
