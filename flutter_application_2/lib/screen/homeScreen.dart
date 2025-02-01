import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.blueAccent,
        backgroundColor: Colors.brown,
        title: Text(
          "Hello, COMICS!",
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
