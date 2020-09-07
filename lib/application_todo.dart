import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApplicationTodo extends ChangeNotifier {
  List<Widget> _todo = [];
  List get getTodo => _todo;

  void addTodo(String activity) {
    _todo.add(Text("ok" + activity));
    notifyListeners();
  }
}
