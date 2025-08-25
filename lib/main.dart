import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gallery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
        '/gallery': (context) => const GalleryScreen(),
      },
    );
  }
}

// All code has been moved to separate files to better organize the project structure.
// The app now uses multiple screens with navigation and both stateless and stateful widgets.
// The screens are:
// - LoginScreen: A stateful widget that handles user input and login functionality
// - HomeScreen: The main dashboard with featured items and a grid view of gallery items
// - DetailScreen: Shows detailed information about a gallery item
// - GalleryScreen: Shows a complete list of gallery items with filtering and view modes
