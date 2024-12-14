import 'package:flutter/material.dart';

class JokeTypeCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const JokeTypeCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 18)),
        trailing: Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}