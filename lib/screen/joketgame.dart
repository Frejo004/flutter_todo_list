import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            final joke = snapshot.data;
            final setup = joke!['setup'];
            final punchline = joke['punchline'];
            print(snapshot.data);

            return Column(
              children: [
                FlipCard(
                  controller: FlipCardController(),
                  rotateSide: RotateSide.left,
                  frontWidget: Card(
                      color: Colors.amberAccent,
                      child: Column(
                        children: [
                          Text('$setup'),
                          SizedBox(height: 10),
                          Text('Joket !')
                        ],
                      )),
                  backWidget: Card(
                      color: Colors.red,
                      child: Column(
                        children: [
                          Text('$punchline'),
                          SizedBox(height: 20),
                          Text('Punchline !')
                        ],
                      )),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      getJoket();
                    });
                  },
                  child: Text('Get New Joke'),
                ),
              ],
            );
          } else {
            return Text("Donnée non troouvées");
          }
        });
  }
}
