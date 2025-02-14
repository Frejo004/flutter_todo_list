import 'package:flutter/material.dart';
import 'package:flutter_todo_list/routes/routes2.0.dart';

import 'screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final Routes routes = Routes() ;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      initialRoute: '/',
      onGenerateRoute: Routing.generateRoute,
    );
  }
}
