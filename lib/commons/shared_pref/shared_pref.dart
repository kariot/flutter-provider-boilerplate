import 'package:injectable/injectable.dart';
import 'package:provider_template/commons/shared_pref/i_shared_pref.dart';
import 'package:provider_template/domain/auth/login_response/login_response.dart';

@Injectable(as: ISharedPref)
class SharedPref extends ISharedPref {
  @override
  Future<String> getAccessToken() async {
    return "";
  }

  @override
  Future<LoginResponse?> getLoginData() async {
    return null;
  }

  @override
  Future<void> saveLoginData(LoginResponse data) async {}
}
