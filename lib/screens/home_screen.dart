import 'package:blocbuilder_repositoryprovider/bloc/product_bloc.dart';
import 'package:blocbuilder_repositoryprovider/cubit/users_cubit.dart';
import 'package:blocbuilder_repositoryprovider/repo/todo_repo.dart';
import 'package:blocbuilder_repositoryprovider/screens/product_screen.dart';
import 'package:blocbuilder_repositoryprovider/screens/users_screen.dart';
import 'package:blocbuilder_repositoryprovider/todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../todo/todo_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                context.read<ProductBloc>().add(ProductsLoadedEvent());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductScreen()));
              },
              child: const Text(
                "Click Here Get Product",
                style: TextStyle(fontSize: 22, color: Colors.blue),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                context.read<UsersCubit>().onloadUsers();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UsersScreen()));
              },
              child: const Text(
                "Click Here Get Users",
                style: TextStyle(fontSize: 22, color: Colors.blue),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                late TodoViewModel todoViewModel;
                todoViewModel =
                    TodoViewModel(todoRepo: context.read<TodoRepo>());
                todoViewModel.getTodos();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoScreen(
                              todoViewModel: todoViewModel,
                            )));
              },
              child: const Text(
                "Click Here Get Todos",
                style: TextStyle(fontSize: 22, color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
