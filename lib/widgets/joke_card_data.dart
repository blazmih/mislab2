import 'package:flutter/material.dart';

class JokeCardData extends StatelessWidget {
  final String setup;
  final String punchline;
  final String type;

  const JokeCardData({super.key, required this.setup, required this.punchline, required this.type});

  @override
  Widget build(BuildContext context) {

    return Column(mainAxisSize: MainAxisSize.min,
      children: [
        Text(type, style: const TextStyle(
            color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600
        ),),
        Text(setup, style: const TextStyle(
            color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600
        ),),
        Text(punchline, style: const TextStyle(
            color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600
        ),)
      ],
    );
  }
}
