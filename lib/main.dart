import 'package:flutter/material.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(child: Text("Todo App")),
        ),
        body: Todo(),
      )
      
    );
  }
}