import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/auth/cubit/cubit/auth_state.dart';
import 'package:todo_app/features/auth/data/interfaces/i_auth_services.dart';
import 'package:todo_app/features/auth/data/services/auth_services_.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(UserUnAuthorized());
  final IAuthServices service = AuthServices();

  Future<void> login(String email, String password) async {
    try {
      emit(UserLoading());
      final user = await service.login(email, password);
      emit(UserAuthorized(user: user));
    } catch (err) {
      emit(UserError(errorMsg: err.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      emit(UserLoading());
      final user = await service.loginWithGoogle();
      emit(UserAuthorized(user: user));
    } catch (err) {
      emit(UserError(errorMsg: err.toString()));
    }
  }

  Future<void> register(String email, String password) async {
    try {
      emit(UserLoading());
      final user = await service.register(email, password);
      emit(UserAuthorized(user: user));
    } catch (err) {
      emit(UserError(errorMsg: err.toString()));
    }

    //ToDo|> Try Then....catchError
  }

  Future<void> forgetPassword(String email) async {
    try {
      emit(UserLoading());
      await service.forgetPassword(email);
      emit(UserForgetPassword());
    } catch (err) {
      emit(UserError(errorMsg: err.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      emit(UserLoading());
      await service.signOut();
      emit(UserUnAuthorized());
    } catch (err) {
      emit(UserError(errorMsg: err.toString()));
    }
  }
}
