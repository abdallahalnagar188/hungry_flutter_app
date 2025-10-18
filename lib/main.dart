import 'package:flutter/material.dart';
import 'package:hungry_flutter_app/features/home/views/home_view.dart';
import 'package:hungry_flutter_app/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hungry app',
      home: const Root(),
    );
  }
}

