import 'package:provider_template/domain/auth/login_response/login_response.dart';

abstract class ISharedPref {
  Future<String> getAccessToken();
  Future<void> saveLoginData(LoginResponse data);
  Future<LoginResponse?> getLoginData();
}
