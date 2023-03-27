// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/todo.dart';
import 'package:task_app/services/todo_service.dart';
import 'package:task_app/widgets/custom_button.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _titleController = TextEditingController();
  final _placeController = TextEditingController();
  final _timeController = TextEditingController();
  final _notificationController = TextEditingController();
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        backgroundColor: Colors.blue[800],
        title: Text("Add new thing"),
        centerTitle: true,
      ),
      body: Scaffold(
        body: Container(
          color: Colors.blue[800],
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //  TextField(),
                TextField(
                  controller: _titleController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
                TextField(
                  controller: _placeController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Place',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
                TextField(
                  controller: _timeController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Time',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
                TextField(
                  controller: _notificationController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Notification',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onTap: () {
                      context.read<TodoService>().addTodo(Todo(
                          title: _titleController.text.trim(),
                          place: _placeController.text,
                          time: _timeController.text));
                    },
                    text: 'ADD YOUR THING')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
