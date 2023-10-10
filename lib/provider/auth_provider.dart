import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_template/commons/shared_pref/i_shared_pref.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/domain/auth/login_response/login_response.dart';
import 'package:provider_template/infrastructure/auth/i_auth_repo.dart';

@injectable
class AuthProvider extends ChangeNotifier {
  IAuthRepo repo;
  ISharedPref sharedPref;
  AuthProvider({
    required this.repo,
    required this.sharedPref,
  });
  Future<Either<ApiFailure, LoginResponse>> loginUser(
      String username, String password) {
    throw UnimplementedError();
  }
}
