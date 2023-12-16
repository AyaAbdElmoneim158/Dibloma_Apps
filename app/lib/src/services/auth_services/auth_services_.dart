import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/core/error/i_failures.dart';
import 'package:todo_app/core/error/server_failure.dart';
import 'package:todo_app/core/helper/dio_helper.dart';
import 'package:todo_app/core/utils/end_points.dart';
import 'package:todo_app/src/model/token_model.dart';
import 'package:todo_app/src/model/user_model.dart';
import 'package:todo_app/src/services/auth_services/i_auth_services.dart';

class AuthService implements IAuthServices {
  final DioHelper dioHelper;

  AuthService(this.dioHelper);

  @override
  Future<Either<IFailure, TokenModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioHelper.post(
        EndPoints.loginUserEndPoint(),
        data: {
          "email": email,
          "password": password,
        },
      );
      return right(TokenModel.fromJson(response.data));
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<IFailure, UserModel>> register({
    required String email,
    required String password,
    required String avatar,
    required String name,
  }) async {
    try {
      final response =
          await dioHelper.post(EndPoints.createUserEndPoint(), data: {
        "email": email,
        "password": password,
        "avatar": avatar,
        "name": name,
      });
      return right(UserModel.fromJson(response.data));
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }
}
