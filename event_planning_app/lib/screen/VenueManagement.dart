import 'package:event_planning_app/main.dart';
import 'package:flutter/material.dart';

class VenueManagement extends StatelessWidget{
  const VenueManagement({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Planning APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    );
  }

}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Hall Name",
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue,
                width: 2.0)
              )
            ),
          )
        ],
      ),

    );
  }
}
  