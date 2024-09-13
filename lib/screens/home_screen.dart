// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../services/todo_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TodoService _todoService = TodoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      appBar: AppBar(
        title: const Text('Todo List'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<List<TodoModel>>(
        future: _todoService.getTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      color: Colors.white,
                      decoration:
                          todo.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (bool? value) {
                      // TODO: Implement update functionality
                    },
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No todos found'));
        },
      ),
    );
  }
}
