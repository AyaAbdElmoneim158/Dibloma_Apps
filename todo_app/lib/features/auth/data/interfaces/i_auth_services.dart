import 'package:todo_app/features/auth/model/user_model.dart';

abstract class IAuthServices {
  const IAuthServices();

  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password);
  Future<UserModel> loginWithGoogle();
  Future<bool> signOut();
  // Future<> forgetPassword();
}