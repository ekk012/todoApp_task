import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/todo.dart';

class TodoService with ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Todo> todos = [];
  addTodo(Todo todo) async {
    await firestore.collection("todos").add({
      "title": todo.title,
      "place": todo.place,
      "time": todo.time,
    }).then((value) {
      todo.id = value.id;
      todos.add(todo);
    });
    notifyListeners();
  }

  removeTodo(id) async {
    var index = todos.indexWhere((element) => element.id == id);
    if (index != -1) {
      await firestore.collection("todos").doc(id).delete();
      todos.removeAt(index);
    }
    notifyListeners();
  }

  updateTodo(Todo todo) async {
    var index = todos.indexWhere((element) => element.id == todo.id);
    if (index != -1) {
      await firestore.collection("todos").doc(todo.id).update({
        "title": todo.title,
        "place": todo.place,
        "time": todo.time,
      });
      todos[index] = todo;
    }
    notifyListeners();
  }
}
