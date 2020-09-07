import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApplicationTodo extends ChangeNotifier {
  final List<Map> _todos = [];

  get todos => _todos;

  void addTodos(String text) {
    _todos.add({"active": false, "text": text});
    print(_todos);
    notifyListeners();
  }

  void updateTodos(int index, String text) {
    _todos[index]["text"] = text;
    notifyListeners();
  }

  void finishTodos(int index, bool active) {
    _todos[index]["active"] = active;
    notifyListeners();
  }

  void removeTodos(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
