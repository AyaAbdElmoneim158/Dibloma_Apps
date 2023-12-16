import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/helper/cache_helper.dart';
import 'package:todo_app/core/helper/dio_helper.dart';
import 'package:todo_app/src/model/user_model.dart';
import 'package:todo_app/src/services/auth_services/auth_services_.dart';
import 'package:todo_app/src/services/auth_services/i_auth_services.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  IAuthServices authServices = AuthService(DioHelper());
  static const String tokenStatus = 'TOKEN_STATUS';
  static const String userRoleStatus = 'USER_ROLE_STATUS';
  UserModel? user;
  String? userToken;
  String userRole = 'customer';
  final DioHelper dioHelper = DioHelper();

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginUserLoadingState());
    var res = await authServices.login(email: email, password: password);
    res.fold(
      (left) {
        debugPrint('loginUser: Failure   ${left.errMessage}');
        emit(LoginUserErrorState(error: left.errMessage));
      },
      (right) {
        userToken = right.refreshToken;
        CacheHelper.saveData(key: tokenStatus, value: userToken);
        debugPrint('loginUser: Successfully with token  $userToken');
        emit(LoginUserSuccessState());
      },
    );
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String avatar,
    required String name,
  }) async {
    emit(RegisterUserLoadingState());
    var res = await authServices.register(
      email: email,
      password: password,
      avatar: avatar,
      name: name,
    );
    res.fold(
      (left) {
        debugPrint('registerUser: Failure ${left.errMessage}');
        emit(RegisterUserErrorState(error: left.errMessage));
      },
      (right) {
        user = right;
        userRole = right.role!;
        CacheHelper.saveData(key: userRoleStatus, value: userRole);
        debugPrint(
            'registerUser: Successfully user with email $email  $userToken');
        emit(RegisterUserSuccessState());
      },
    );
  }
}
