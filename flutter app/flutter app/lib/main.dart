import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const TruthOrDareApp());
}

class TruthOrDareApp extends StatefulWidget {
  const TruthOrDareApp({super.key});

  @override
  State<TruthOrDareApp> createState() => _TruthOrDareAppState();
}

class _TruthOrDareAppState extends State<TruthOrDareApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Truth or Dare Spinner',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: Stack(
        children: [
          const HomeScreen(),
          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton(
              onPressed: _toggleTheme,
              child: Icon(_themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
              tooltip: 'Toggle Theme',
            ),
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
} 