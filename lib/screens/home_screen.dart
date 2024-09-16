import 'package:flutter/material.dart';
import '../services/todo_service.dart';
import '../models/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoService _todoService = TodoService();
  late Future<List<TodoModel>> _todosFuture;

  @override
  void initState() {
    super.initState();
    _todosFuture = _todoService.getTodos();
  }

  Future<void> _addTodo(String title) async {
    await _todoService.addTodo(title);
    _refreshTodos();
  }

  Future<void> _toggleTodoCompletion(TodoModel todo) async {
    final updatedTodo =
        todo.copyWith(isCompleted: !(todo.isCompleted ?? false));
    await _todoService.updateTodo(updatedTodo);
    _refreshTodos();
  }

  Future<void> _deleteTodo(TodoModel todo) async {
    await _todoService.deleteTodo(todo.id);
    _refreshTodos();
  }

  void _refreshTodos() {
    setState(() {
      _todosFuture = _todoService.getTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: FutureBuilder<List<TodoModel>>(
        future: _todosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return AnimatedList(
              initialItemCount: snapshot.data!.length,
              itemBuilder: (context, index, animation) {
                final todo = snapshot.data![index];
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: Dismissible(
                    key: Key(todo.id.toString()),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      _deleteTodo(todo);
                    },
                    child: ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isCompleted ?? false
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      leading: Checkbox(
                        value: todo.isCompleted ?? false,
                        onChanged: (bool? value) {
                          _toggleTodoCompletion(todo);
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No todos found'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Todo'),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: "Enter todo title"),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  _addTodo(textController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
