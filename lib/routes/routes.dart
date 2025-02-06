
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_todo_list/screen/home.dart';
import 'package:flutter_todo_list/screen/login.dart';
import 'package:flutter_todo_list/screen/register.dart';

class Routes {
  final Map<String, WidgetBuilder> _routes = 
    {
      '/': (context) => const LoginPage(),
      '/register': (context) => const Register(),
      '/home': (context) => const HomePage(),
    };

  Map<String, WidgetBuilder> getRoutes() {
    return _routes;
  }
}