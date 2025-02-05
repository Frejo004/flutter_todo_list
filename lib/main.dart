import 'package:flutter/material.dart';
import 'screen/home.dart';



void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Roboto",
      ),

      home:Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 254, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 151, 202, 153),
          title: Center(child: Text("To Do List")),
        ),

        body: HomePage(),
      ) ,
    );
  }
}