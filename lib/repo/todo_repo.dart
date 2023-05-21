import 'package:blocbuilder_repositoryprovider/todo/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepo {
  Future<List<TodoModel>> getTodos() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      return todoModelFromJson(response.body);
    } else {
      throw Exception('Failed to load Todos');
    }
  }
}
