import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_todo_list/screen/home.dart';
import 'package:flutter_todo_list/screen/joketgame.dart';
import 'package:flutter_todo_list/screen/login.dart';
import 'package:flutter_todo_list/screen/register.dart';
import 'package:page_transition/page_transition.dart';

class Routing {
  //generateRoute(route)
  static Route<dynamic> generateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case '/':
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const LoginPage(),
          duration: const Duration(microseconds: 2000),
        );

      case '/home':
        return PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          child: const HomePage(),
          duration: const Duration(microseconds: 2000),
        );

      case '/register':
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const Register(),
          duration: const Duration(microseconds: 2000),
        );

      case '/joket':
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const JoketGame(),
          duration: const Duration(microseconds: 2000),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("La route n'existe pas 😛😛😛😌"),
                  ),
                ));
    }
  }
}
