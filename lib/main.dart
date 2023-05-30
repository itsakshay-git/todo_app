import 'package:flutter/material.dart';
import 'add_todo_screen.dart';
import 'todo.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = []; // Initialize an empty list of todos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Todo List')),
      // body: ListView.builder(
      //   itemCount: todos.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     final todo = todos[index];
      //     return ListTile(
      //       title: Text(todo.title),
      //       subtitle: Text(todo.description),
      //       trailing: Checkbox(
      //         value: todo.isCompleted,
      //         onChanged: (bool? value) {
      //           setState(() {
      //             todo.isCompleted = value!;
      //             if (todo.isCompleted) {
      //               todos.removeAt(index);
      //             }
      //           });
      //         },
      //       ),
      //     );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => AddTodoScreen()),
      //     ).then((newTodo) {
      //       if (newTodo != null) {
      //         setState(() {
      //           todos.add(newTodo);
      //         });
      //       }
      //     });
      //   },
      //   child: const Icon(Icons.add),
      // ),

      appBar: AppBar(title: const Text('Todo List')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: todo.isCompleted,
                  onChanged: (bool? value) {
                    setState(() {
                      todo.isCompleted = value!;
                    });
                  },
                ),
                if (todo.isCompleted)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoScreen()),
          ).then((newTodo) {
            if (newTodo != null) {
              setState(() {
                todos.add(newTodo);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
