import 'package:flutter/material.dart';
import 'package:mislab2/screens/random_joke.dart';
import 'package:mislab2/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes',
      initialRoute: '/',
      routes: {
        '/' : (context) =>  HomeScreen(),
        '/randomjoke': (context) => RandomJoke(),
      },
    );
  }
}
