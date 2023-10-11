import 'package:dartz/dartz.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/domain/auth/login_response/login_response.dart';

abstract class IAuthRepo {
  Future<Either<ApiFailure, LoginResponse>> signInUser(
      String username, String password);
}
