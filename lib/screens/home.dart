import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_card_type.dart';
import 'joke_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joke Types"),
        actions: [
          IconButton(
            icon: Icon(Icons.face_2_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/randomjoke');
            },
          ),
        ],
      ),
      backgroundColor: Colors.orange,
      body: FutureBuilder<List<String>>(
        future: ApiServices.getJokeTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return ListView(
              padding: EdgeInsets.all(8.0),
              children: snapshot.data!
                  .map((type) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JokeScreen(type: type),
                    ),
                  );
                },
                child: Card(
                  color: Colors.blue, // Sets the background color to blue
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4, // Adds a shadow to the card
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color for contrast
                      ),
                    ),
                  ),
                ),
              ))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
