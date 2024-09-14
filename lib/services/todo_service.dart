// lib/services/todo_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/todo_model.dart';

class TodoService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await _supabase.from('todos').select('*');

      return (response as List)
          .map((todo) => TodoModel.fromJson(todo))
          .toList();
    } catch (error) {
      throw Exception('Failed to fetch todos: $error');
    }
  }
}
