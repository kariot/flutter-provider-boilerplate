import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_template/commons/shared_pref/i_shared_pref.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/domain/auth/login_response/login_response.dart';
import 'package:provider_template/infrastructure/auth/i_auth_repo.dart';
import 'package:provider_template/provider/utils/disposable_provider.dart';

@injectable
class AuthProvider extends DisposableProvider {
  IAuthRepo repo;
  ISharedPref sharedPref;
  bool isAuthRequesting = false;
  AuthProvider({
    required this.repo,
    required this.sharedPref,
  });
  Future<Either<ApiFailure, LoginResponse>> loginUser(
      String username, String password) async {
    isAuthRequesting = true;
    notifyListeners();
    final response = await repo.signInUser(username, password);
    isAuthRequesting = false;
    notifyListeners();
    return response;
  }

  @override
  void disposeValues() {
    isAuthRequesting = false;
  }
}
