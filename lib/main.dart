import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map> todos = new List();
  String buttonText = "Add";

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
      home: Scaffold(
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
            RaisedButton(
              onPressed: () {
                addTodo();
                controller.clear();
              },
              child: Text(buttonText),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int Index) {
                      return Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                todos[Index]["text"].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    decoration: (todos[Index]["active"])
                                        ? TextDecoration.lineThrough
                                        : null),
                              ),
                              padding: EdgeInsets.all(10),
                              width: 120,
                            ),
                            RaisedButton(
                              onPressed: () {
                                if (todos[Index]["active"] == true) {
                                  todos[Index]["active"] = false;
                                } else {
                                  todos[Index]["active"] = true;
                                }
                                setState(() {});
                              },
                              child: Icon(Icons.check),
                            ),
                            RaisedButton(
                              onPressed: () {
                                controller.text = todos[Index]["text"];
                                buttonText = "Update";
                                setState(() {});
                              },
                              child: Icon(Icons.edit),
                            ),
                            RaisedButton(
                              onPressed: () {
                                todos.removeAt(Index);
                                setState(() {});
                              },
                              child: Icon(Icons.delete),
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
