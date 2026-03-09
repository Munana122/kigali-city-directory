import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'providers/auth_provider.dart';
import 'providers/location_provider.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: MaterialApp(
        title: 'Kigali City Directory',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          // Dark Navy Theme matching your screenshot
          scaffoldBackgroundColor: const Color(0xFF0D1B2A),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFFB703),
            brightness: Brightness.dark,
            primary: const Color(0xFFFFB703), // Yellow accent
            surface: const Color(0xFF1B263B), // Darker navy for cards
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0D1B2A),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF1B263B),
            selectedItemColor: Color(0xFFFFB703),
            unselectedItemColor: Colors.grey,
          ),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
