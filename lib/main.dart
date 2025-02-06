import 'package:flutter/material.dart';
import 'package:flutter_todo_list/screen/home.dart';
import 'package:flutter_todo_list/screen/register.dart';

import 'screen/login.dart';void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      initialRoute: '/',
      routes: {
        '/register': (context) => const Register(),
        '/home': (context) => const HomePage(),
      }
    );
  }
}