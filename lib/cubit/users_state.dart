part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<UsersModel> usersModel;

  const UsersLoadedState({required this.usersModel});
}

class UsersErrorState extends UsersState {
  final String errorMessage;

  const UsersErrorState({required this.errorMessage});
}
