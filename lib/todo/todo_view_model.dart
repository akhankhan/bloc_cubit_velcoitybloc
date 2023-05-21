import 'package:blocbuilder_repositoryprovider/repo/todo_repo.dart';
import 'package:blocbuilder_repositoryprovider/todo/todo_model.dart';
import 'package:velocity_bloc/utils/velocity_cubit/velocity_cubit.dart';

class TodoViewModel {
  final TodoRepo todoRepo;

  TodoViewModel({required this.todoRepo});

  final VelocityBloc<List<TodoModel>?> todoModelBloc =
      VelocityBloc<List<TodoModel>?>(null);

  getTodos() async {
    try {
      var data = await todoRepo.getTodos();
      todoModelBloc.onUpdateData(data);
    } catch (e) {
      todoModelBloc.onFailedResponse(error: e.toString());
    }
  }
}
