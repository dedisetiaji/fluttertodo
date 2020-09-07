import 'package:flutter/material.dart';
import 'package:flutter_todo/application_todo.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map> todos = new List();
  String buttonText = "Add";
  int indexTodos = 0;

  TextEditingController controller = TextEditingController(text: "");
  void addTodo() {
    todos.add({"active": false, "text": controller.text});
    print(todos);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void deleteTodo(Index) {
    print(Index);
    todos.removeAt(Index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationTodo>(
        builder: (context) => ApplicationTodo(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Learning todo using flutter"),
          ),
          resizeToAvoidBottomPadding: false,
          body: Column(
            children: <Widget>[
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Masukkan kegiatan",
                ),
              ),
              Consumer<ApplicationTodo>(
                builder: (context, applicationTodo, _) => RaisedButton(
                  onPressed: () {
                    if (buttonText == "Update") {
                      applicationTodo.updateTodos(indexTodos, controller.text);
                    } else {
                      applicationTodo.addTodos(controller.text);
                    }
                    controller.clear();
                  },
                  child: Text(buttonText),
                ),
              ),
              Expanded(
                  child: Consumer<ApplicationTodo>(
                      builder: (context, applicationTodo, _) =>
                          ListView.builder(
                              itemCount: applicationTodo.todos.length,
                              itemBuilder: (BuildContext context, int Index) {
                                return Card(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          applicationTodo.todos[Index]["text"],
                                          style: TextStyle(
                                              decoration: (applicationTodo
                                                      .todos[Index]["active"])
                                                  ? TextDecoration.lineThrough
                                                  : null),
                                        ),
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          applicationTodo.finishTodos(
                                              Index,
                                              !applicationTodo.todos[Index]
                                                  ["active"]);
                                        },
                                        child: Icon(Icons.check),
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          controller.text = applicationTodo
                                              .todos[Index]["text"];
                                          buttonText = "Update";
                                          indexTodos = Index;
                                          setState(() {});
                                        },
                                        child: Icon(Icons.edit),
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          applicationTodo.removeTodos(Index);
                                          buttonText = "Add";
                                          setState(() {});
                                        },
                                        child: Icon(Icons.delete),
                                      )
                                    ],
                                  ),
                                );
                              })))
            ],
          ),
        ),
      ),
    );
  }
}
