import 'package:bloc/bloc.dart';
import 'package:blocbuilder_repositoryprovider/model/users_model.dart';
import 'package:blocbuilder_repositoryprovider/repo/users_repo.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersRepo usersRepo;
  UsersCubit({required this.usersRepo}) : super(UsersLoadingState());

  onloadUsers() async {
    try {
      emit(UsersLoadingState());
      var data = await usersRepo.getUsers();
      emit(UsersLoadedState(usersModel: data));
    } catch (e) {
      emit(UsersErrorState(errorMessage: e.toString()));
    }
  }
}
