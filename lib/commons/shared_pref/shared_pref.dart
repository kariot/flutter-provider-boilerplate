import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_template/commons/shared_pref/i_shared_pref.dart';
import 'package:provider_template/domain/auth/login_response/login_response.dart';

@Injectable(as: ISharedPref)
class SharedPref extends ISharedPref {
  final _loginDataKey = 'loginDataKey';

  final FlutterSecureStorage storage;

  SharedPref({required this.storage});
  @override
  Future<String> getAccessToken() async {
    return "";
  }

  @override
  Future<LoginResponse?> getLoginData() async {
    String jsonString = await storage.read(key: _loginDataKey) ?? '{}';
    Map<String, dynamic> json = jsonDecode(jsonString);
    return LoginResponse.fromJson(json);
  }

  @override
  Future<void> saveLoginData(LoginResponse data) async {
    final dataJson = data.toJson();
    final dataString = jsonEncode(dataJson);
    await storage.write(key: _loginDataKey, value: dataString);
  }

  @override
  Future<void> clear() async {
    await storage.deleteAll();
  }
}
