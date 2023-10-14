import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SharedPredModules {
  @singleton
  FlutterSecureStorage get secureStorage {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    return FlutterSecureStorage(aOptions: getAndroidOptions());
  }
}
