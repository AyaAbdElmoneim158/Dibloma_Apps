import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/i_failures.dart';
import 'package:todo_app/src/model/token_model.dart';
import 'package:todo_app/src/model/user_model.dart';

abstract class IAuthServices {
  const IAuthServices();

  Future<Either<IFailure, TokenModel>> login({
    required String email,
    required String password,
  });

 Future<Either<IFailure, UserModel>>
   register({
    required String email,
    required String password,
    required String avatar,
    required String name,
  });
}
