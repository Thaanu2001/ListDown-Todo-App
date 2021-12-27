import 'package:flutter/material.dart';
import 'package:listdown_todo_app/screens/todo_list_screen.dart';

void main() {
  runApp(const ListDown());
}

class ListDown extends StatelessWidget {
  const ListDown({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListDown',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListScreen(),
    );
  }
}
