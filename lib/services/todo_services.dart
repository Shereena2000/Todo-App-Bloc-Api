import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/data/data_model.dart';

class TodoServices {
  static const String apiUrl = 'https://api.nstack.in/v1/todos';
  Future<void> CreateTodo(Todo todo) async {
    final uri = Uri.parse(apiUrl);
    final response = await http.post(uri,
        body: jsonEncode(todo), headers: {'Content-Type': ' application/json'});

    if (response.statusCode == 201) {
      print('Creation Success');
    } else {
      print("Creation fAILED");
      print(response.body);
    }
  }

  Future<List<Todo>>FetchTodo()async{
    final url='https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri =Uri.parse(url);
    final response=await http.get(uri);
     if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Todo.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
    print("-----------------------------------------------------------");
    print(response.statusCode);
    print("-----------------------------------------------------------");
    print(response.body);
    print("-----------------------------------------------------------");
  }
}
