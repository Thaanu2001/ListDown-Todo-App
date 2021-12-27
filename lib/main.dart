import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listdown_todo_app/screens/todo_list_screen.dart';

void main() {
  runApp(const ListDown());
}

class ListDown extends StatelessWidget {
  const ListDown({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent, // Color for Android
          statusBarBrightness:
              Brightness.light // Dark == white status bar -- for IOS.
          ),
    );

    return MaterialApp(
      title: 'ListDown',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child as Widget,
        );
      },
      home: const TodoListScreen(),
    );
  }
}
