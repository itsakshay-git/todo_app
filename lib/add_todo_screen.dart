import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime _dueDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _dueDate = DateTime.now();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );

    if (selectedDate != null) {
      setState(() {
        _dueDate = selectedDate;
      });
    }
  }

  void _addTodo() {
    final newTodo = Todo(
      title: _titleController.text,
      description: _descriptionController.text,
      dueDate: _dueDate,
    );

    Navigator.pop(context, newTodo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              children: [
                Text('Due Date:'),
                SizedBox(width: 8.0),
                TextButton(
                  onPressed: _showDatePicker,
                  child: Text(_dueDate.toString().split(' ')[0]),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: _addTodo,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
