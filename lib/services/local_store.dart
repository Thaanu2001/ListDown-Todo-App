import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:listdown_todo_app/global_variables.dart' as globals;

class LocalStore {
  storeData(title, notes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String list = prefs.getString('todoList') ?? '';

    if (list == '') {
      globals.todoList = {
        getRandomString(10): [title, notes]
      };
    } else {
      globals.todoList.addEntries({title, notes});
    }

    prefs.setString('todoList', json.encode(globals.todoList));
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String list = prefs.getString('todoList') ?? '';

    if (list != '') {
      globals.todoList = json.decode(list);
    }
  }

  String getRandomString(int length) {
    String _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
