import 'package:flutter/material.dart';
import 'package:pc_controller/Screens/Home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting a boilerplateless access to the MediaQuery
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    final Brightness brightness = mediaQuery.platformBrightness;

    return MaterialApp(
      theme: ThemeData(useMaterial3: true, brightness: brightness),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
