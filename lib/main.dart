import 'package:blocbuilder_repositoryprovider/repo/todo_repo.dart';
import 'package:blocbuilder_repositoryprovider/repo/users_repo.dart';
import 'package:blocbuilder_repositoryprovider/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_bloc.dart';
import 'cubit/users_cubit.dart';
import 'debug/bloc_observer.dart';
import 'repo/products_repo.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => ProductsRepo(),
      ),
      RepositoryProvider(
        create: (context) => UsersRepo(),
      ),
      RepositoryProvider(
        create: (context) => TodoRepo(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(productsRepo: ProductsRepo()),
        ),
        BlocProvider(
          create: (context) => UsersCubit(usersRepo: UsersRepo()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
