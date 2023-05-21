import 'package:blocbuilder_repositoryprovider/todo/todo_model.dart';
import 'package:blocbuilder_repositoryprovider/todo/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_bloc/utils/velocity_cubit/velocity_cubit.dart';

class TodoScreen extends StatefulWidget {
  final TodoViewModel todoViewModel;
  const TodoScreen({super.key, required this.todoViewModel});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // late TodoViewModel todoViewModel;
  @override
  void initState() {
    // todoViewModel = TodoViewModel(todoRepo: context.read<TodoRepo>());
    // todoViewModel.getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
      ),
      body: BlocBuilder<VelocityBloc<List<TodoModel>?>,
          VelocityState<List<TodoModel>?>>(
        bloc: widget.todoViewModel.todoModelBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is VelocityUpdateState) {
            return ListView.builder(
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                var data = state.data![index];
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  title: Text(data.title.toString()),
                  subtitle: Text(
                    data.completed.toString(),
                    style: TextStyle(
                      color: data.completed == true ? Colors.green : Colors.red,
                    ),
                  ),
                );
              },
            );
          } else if (state is VelocityFailedState) {
            return Center(
              child: Text(state.error),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
