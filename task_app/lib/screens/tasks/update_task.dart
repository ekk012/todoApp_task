import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../models/todo.dart';
import '../../services/todo_service.dart';
import '../../widgets/custom_button.dart';

class UpdateTask extends StatefulWidget {
  final Todo todo;

  const UpdateTask({super.key, required this.todo});
  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  @override
  void initState() {
    _titleController.text = widget.todo.title;
    _placeController.text = widget.todo.place;
    _timeController.text = widget.todo.time;
    super.initState();
  }

  final _titleController = TextEditingController();
  final _placeController = TextEditingController();
  final _timeController = TextEditingController();
  final _notificationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        backgroundColor: Colors.blue[800],
        title: const Text("Update"),
        centerTitle: true,
      ),
      body: Scaffold(
        body: Container(
          color: Colors.blue[800],
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // TextField(),
                TextField(
                  controller: _titleController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
                TextField(
                  controller: _placeController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const  InputDecoration(
                      hintText: 'Place',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
                TextField(
                  controller: _timeController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                      hintText: 'Time',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
                TextField(
                  controller: _notificationController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                      hintText: 'Notification',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onTap: () {
                      context.read<TodoService>().updateTodo(Todo(
                          id: widget.todo.id,
                          title: _titleController.text.trim(),
                          place: _placeController.text,
                          time: _timeController.text));
                    },
                    text: 'Update task')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
