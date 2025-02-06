import 'package:flutter/material.dart';
import 'package:flutter_todo_list/screen/home.dart';
import 'package:flutter_todo_list/screen/register.dart';
import 'routes/routes.dart';



import 'screen/login.dart';void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    final Routes routes = Routes() ;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes.getRoutes(),
    );
  }
}