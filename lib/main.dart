import 'package:flutter/material.dart';

import 'api_repo.dart';
import 'scroll_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ScrollScreen(),
    );
  }
}
