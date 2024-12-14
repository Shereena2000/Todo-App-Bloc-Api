import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/data/data_model.dart';

class TodoServices {
  static const String apiUrl = 'https://api.nstack.in/v1/todos';
  Future<void> CreateTodo(Todo todo) async {
    try {
      final uri = Uri.parse(apiUrl);
      final response = await http.post(uri,
          body: jsonEncode(todo),
          headers: {'Content-Type': ' application/json'});

      if (response.statusCode == 201) {
        print(response.statusCode);
        print('Creation Success---------------------');
      } else {
        print("Creation fAILED------------------");
        print(response.statusCode);
        print(response.body);
      }
    } catch (e) {
      print('Error occurred while creating Todo: $e');
    }
  }

  Future<List<Todo>> FetchTodo() async {
    try {
      final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      print("-----------------");
      print(response.statusCode);
      print(response.body);
      print("-----------------");

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        List<dynamic> items = jsonResponse['items'];

        return items.map((item) => Todo.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      print('Error fetching todos: $e');
      throw Exception('Failed to load todos');
    }
  }

  Future<void> UpdatedTodo(Todo todo) async {
    try {
      final uri = Uri.parse('https://api.nstack.in/v1/todos/${todo.id}');
      final response = await http.put(
        uri,
        body: jsonEncode(todo.toJson()),
        headers: {'Content-Type': ' application/json'},
      );
      if (response.statusCode == 200) {
        print("Todo updated success fully");
      } else {
        throw Exception('Failed to update Todo: ${response.body}');
      }
    } catch (e) {
      print('Error updating Todo: $e');
      throw Exception('Error updating Todo');
    }
  }

  Future<void> DeleteTodo(String id) async {
    try {
      final uri = Uri.parse('https://api.nstack.in/v1/todos/$id');
      final response = await http.delete(uri);
      if (response.statusCode == 200) {
        print("Todo deleted successfully");
      } else {
        throw Exception('failed to delete Todo :${response.body}');
      }
    } catch (e) {
      print('Error deleting Todo: $e');
      throw Exception('Error deleting Todo');
    }
  }
}
