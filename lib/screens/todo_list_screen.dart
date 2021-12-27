import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listdown_todo_app/screens/new_tast_screen.dart';

import 'package:listdown_todo_app/global_variables.dart' as globals;
import 'package:listdown_todo_app/services/local_store.dart';
import 'package:vibration/vibration.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    LocalStore().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('New Task'),
        icon: const Icon(Icons.add_circle_sharp),
        onPressed: () {
          Route route =
              CupertinoPageRoute(builder: (context) => const NewTaskScreen());
          Navigator.push(context, route).then((value) => setState(() {}));
        },
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery.of(context).padding.top + 10, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (DateFormat('EEEE dd LLLL')
                  .format(DateTime.now())
                  .toString()
                  .toUpperCase()),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Task List',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 1),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Todo',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  ValueListenableBuilder<Map>(
                    valueListenable: globals.todoList,
                    builder: (context, todoList, child) {
                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: 10),
                        children: [
                          for (var task in todoList.entries)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: InkWell(
                                      child: IgnorePointer(
                                        ignoring: true,
                                        child: Radio(
                                            value: task.value[2] as bool,
                                            groupValue: true,
                                            onChanged: (val) {}),
                                      ),
                                      onTap: () async {
                                        task.value[2] = !task.value[2];
                                        await LocalStore().updateData(task);
                                        setState(() {});
                                        if (await Vibration.hasVibrator() ??
                                            false) {
                                          Vibration.vibrate(duration: 100);
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        task.value[0],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        task.value[1],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          if (todoList.isEmpty)
                            const Text(
                              'No tasks available',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            )
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
