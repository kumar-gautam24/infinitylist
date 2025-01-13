import 'package:flutter/material.dart';

import 'api_repo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                await BookRepo().getBooks(5);
              },
              child: Text('Click Me'),),
        ),
      ),
    );
  }
}
