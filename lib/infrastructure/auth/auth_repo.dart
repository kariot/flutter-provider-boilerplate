import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/domain/auth/login_response/login_response.dart';
import 'package:provider_template/infrastructure/api_constants.dart';
import 'package:provider_template/infrastructure/auth/i_auth_repo.dart';
import 'package:provider_template/infrastructure/base/base_repo.dart';

@Injectable(as: IAuthRepo)
class AuthRepo extends IAuthRepo with BaseRepo {
  @override
  Future<Either<ApiFailure, LoginResponse>> signInUser(
      String username, String password) {
    const url = ApiConstants.loginUrl;
    return super.post(
        url,
        {'username': username, 'password': password},
        (p0) => LoginResponse.fromJson(p0 as Map<String, dynamic>),
        (p0) => p0?['message'] ?? 'Sign in failed.');
  }
}
