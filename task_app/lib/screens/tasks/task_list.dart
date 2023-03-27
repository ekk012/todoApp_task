import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:provider/provider.dart';
import 'package:task_app/screens/tasks/update_task.dart';
import 'package:task_app/services/todo_service.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TodoService>(
          builder: ((context, value, child) => ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(child: Icon(Icons.task)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateTask(
                                          todo: value.todos[index],
                                        )));
                          },
                          subtitle: Text(value.todos[index].place),
                          title: Text(value.todos[index].title),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(value.todos[index].time),
                              IconButton(
                                  onPressed: () {
                                    context
                                        .read<TodoService>()
                                        .removeTodo(value.todos[index].id);
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                      ],
                    )),
                itemCount: value.todos.length,
              ))),
    );
  }
}
