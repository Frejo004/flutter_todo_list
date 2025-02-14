import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class JoketGame extends StatefulWidget {
  const JoketGame({super.key});

  @override
  State<JoketGame> createState() => _JoketGameState();
}

class _JoketGameState extends State<JoketGame> {
  final String url = 'https://official-joke-api.appspot.com/random_joke';

  Future<Map<String, dynamic>> getJoket() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('Erreur lors de la récupération');
    }
  }

  @override
  Widget build(BuildContext context) {
    getJoket();
    return FutureBuilder(
        future: getJoket(),
        builder: (context, snapshot) {
          print(snapshot);

          return Text("Like a joke !");
        });
  }
}
