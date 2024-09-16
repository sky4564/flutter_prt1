import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/todo_model.dart';
import 'package:flutter/foundation.dart';

class TodoService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<TodoModel>> getTodos() async {
    try {
      debugPrint('Fetching todos from Supabase...');
      final response = await _supabase
          .from('todos')
          .select()
          .order('created_at', ascending: false);
      debugPrint('Supabase response: $response');
      final todos = (response as List).map((todo) {
        debugPrint('Processing todo: $todo');
        return TodoModel.fromJson(todo);
      }).toList();
      debugPrint('Processed ${todos.length} todos');
      return todos;
    } catch (error) {
      debugPrint('Error fetching todos: $error');
      throw Exception('Failed to fetch todos: $error');
    }
  }

  Future<TodoModel> addTodo(String title) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      final newTodo = {
        'title': title,
        'isCompleted': false,
        'user_id': userId,
      };
      final response =
          await _supabase.from('todos').insert(newTodo).select().single();
      return TodoModel.fromJson(response);
    } catch (error) {
      debugPrint('Error adding todo: $error');
      throw Exception('Failed to add todo: $error');
    }
  }

  Future<void> updateTodo(TodoModel todo) async {
    try {
      await _supabase.from('todos').update({
        'title': todo.title,
        'isCompleted': todo.isCompleted,
      }).eq('id', todo.id);
    } catch (error) {
      debugPrint('Error updating todo: $error');
      throw Exception('Failed to update todo: $error');
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      await _supabase.from('todos').delete().eq('id', id);
    } catch (error) {
      debugPrint('Error deleting todo: $error');
      throw Exception('Failed to delete todo: $error');
    }
  }
}
