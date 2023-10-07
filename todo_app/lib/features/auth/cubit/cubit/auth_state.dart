import 'package:equatable/equatable.dart';
import 'package:todo_app/features/auth/model/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class UserUnAuthorized extends AuthState {} //! Init

final class UserLoading extends AuthState {}

final class UserAuthorized extends AuthState {
  final UserModel user;
  const UserAuthorized({required this.user});

  @override
  List<Object> get props => [user];
}

final class UserError extends AuthState {
  final String errorMsg;
  const UserError({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

final class UserForgetPassword extends AuthState {}
