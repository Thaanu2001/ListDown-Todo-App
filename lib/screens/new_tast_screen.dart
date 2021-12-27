import 'package:flutter/material.dart';
import 'package:listdown_todo_app/services/local_store.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F1F6),
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).padding.top + 10, 20, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(Icons.arrow_back_ios_new_rounded),
                    onTap: () => Navigator.pop(context),
                  ),
                  const Text(
                    'New Task',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    child: const Icon(Icons.done_rounded, size: 28),
                    onTap: () async {
                      await LocalStore().storeData(title.text, notes.text);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 22, bottom: 15),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: title,
                          decoration: const InputDecoration(
                            hintText: 'Title',
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(width: 0.5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: notes,
                          minLines: 3,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: 'Notes',
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(width: 0.5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
