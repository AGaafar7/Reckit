import 'package:flutter/material.dart';
import 'pages/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '', routes: {"/": (context) => HomeScreen()});
  }
}
