import 'package:flutter/material.dart';
import 'package:pc_controller/Screens/Home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          brightness: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Brightness.light
              : Brightness.dark),
          debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
