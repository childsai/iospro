import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

