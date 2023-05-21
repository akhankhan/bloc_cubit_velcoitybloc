import 'package:blocbuilder_repositoryprovider/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Screen"),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is UsersLoadedState) {
            return ListView.builder(
              itemCount: state.usersModel.length,
              itemBuilder: (context, index) {
                var data = state.usersModel[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.name.toString()),
                        Text(data.email.toString()),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is UsersErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
