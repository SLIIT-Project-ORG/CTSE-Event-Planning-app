import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Planning APP"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("This is main page.. Dont touh this",
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}