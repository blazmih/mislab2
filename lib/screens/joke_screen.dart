import 'package:flutter/material.dart';
import 'package:mislab2/models/joke.dart';
import 'package:mislab2/services/api_services.dart';
import '../widgets/joke_card.dart';

class JokeScreen extends StatelessWidget {
  final String type;

  const JokeScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$type Jokes"),
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiServices.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return ListView(
              children: snapshot.data!
                  .map((joke) => JokeCard(
                id: joke.id,
                type: joke.type,
                setup: joke.setup,
                punchline: joke.punchline,
              ))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}