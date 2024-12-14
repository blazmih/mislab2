import 'package:flutter/material.dart';
import 'package:mislab2/models/joke.dart';
import 'package:mislab2/widgets/joke_card_data.dart';

class JokeCard extends StatelessWidget {
  final int id;
  final String setup;
  final String punchline;
  final String type;

  const JokeCard({super.key, required this.id, required this.setup, required this.punchline, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.orange[50],
          onTap: () => {
            Navigator.pushNamed(context, '/jokes',
                arguments: Joke(id: id, setup: setup, punchline: punchline, type: type))
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange.withOpacity(0.8), width: 2),
                borderRadius: BorderRadius.circular(10)
            ),
            child: JokeCardData(setup: setup, punchline: punchline, type: type),
          )
      ),
    );
  }
}
