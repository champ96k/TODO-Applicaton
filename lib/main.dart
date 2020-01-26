import 'package:flutter/material.dart';
import 'package:todo_with_sql_flight/HomePage.dart';
import 'package:todo_with_sql_flight/note_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TO Do",
      home: Scaffold(
        body:HomePage(),
      ),
    );
  }
}