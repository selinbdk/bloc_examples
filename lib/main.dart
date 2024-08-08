import 'package:flutter/material.dart';

import 'examples/practices/sample/view/json_placeholder_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonPlaceholderView(),
    );
  }
}
