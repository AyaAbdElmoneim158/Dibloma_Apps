part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

//* loginUser-States * * * * * * * * * * * * * * * *
class LoginUserLoadingState extends AuthState {}

class LoginUserSuccessState extends AuthState {}

class LoginUserErrorState extends AuthState {
  final String error;
  const LoginUserErrorState({required this.error});
}

//* registerUser-States * * * * * * * * * * * * * * * *
class RegisterUserLoadingState extends AuthState {}

class RegisterUserSuccessState extends AuthState {}

class RegisterUserErrorState extends AuthState {
  final String error;
  const RegisterUserErrorState({required this.error});
}
