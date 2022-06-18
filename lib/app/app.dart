import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/home/home_view.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // privat named constrictor
  static final MyApp instance = MyApp._internal();
  factory MyApp() => instance;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Food delivery",
      home: HomePage(),
    );
  }
}
