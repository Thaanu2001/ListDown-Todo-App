import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:listdown_todo_app/global_variables.dart' as globals;

class LocalStore {
  storeData(title, notes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String list = prefs.getString('todoList') ?? '';

    if (list == '') {
      globals.todoList.value = {
        getRandomString(10): [title, notes, false]
      };
    } else {
      globals.todoList.value[getRandomString(10)] = [title, notes, false];
    }
    prefs.setString('todoList', json.encode(globals.todoList.value));
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String list = prefs.getString('todoList') ?? '';

    if (list != '') {
      globals.todoList.value = await json.decode(list);
      sortData();
    }
  }

  updateData(task) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (globals.todoList.value != {}) {
      globals.todoList.value[task.key] = task.value;
    }
    sortData();
    prefs.setString('todoList', json.encode(globals.todoList.value));
  }

  sortData() {
    var doneList = {};
    var todoList = {};

    for (var task in globals.todoList.value.entries) {
      if (!(task.value[2])) {
        todoList[task.key] = task.value;
      } else {
        doneList[task.key] = task.value;
      }
    }

    globals.todoList.value = todoList;
    globals.todoList.value.addAll(doneList);
  }

  String getRandomString(int length) {
    String _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
