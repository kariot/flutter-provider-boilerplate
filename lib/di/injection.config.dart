// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:provider_template/commons/shared_pref/i_shared_pref.dart'
    as _i630;
import 'package:provider_template/commons/shared_pref/shared_pref.dart' as _i39;
import 'package:provider_template/di/modules/shared_pref_modules.dart' as _i816;
import 'package:provider_template/infrastructure/auth/auth_repo.dart' as _i419;
import 'package:provider_template/infrastructure/auth/i_auth_repo.dart'
    as _i1000;
import 'package:provider_template/infrastructure/home/home_repo.dart' as _i521;
import 'package:provider_template/infrastructure/home/i_home_repo.dart' as _i32;
import 'package:provider_template/provider/auth_provider.dart' as _i242;
import 'package:provider_template/provider/home_provider.dart' as _i848;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPrefModules = _$SharedPrefModules();
    gh.singleton<_i558.FlutterSecureStorage>(
        () => sharedPrefModules.secureStorage);
    gh.factory<_i630.ISharedPref>(
        () => _i39.SharedPref(storage: gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i32.IHomeRepo>(() => _i521.HomeRepo());
    gh.factory<_i1000.IAuthRepo>(() => _i419.AuthRepo());
    gh.factory<_i848.HomeProvider>(
        () => _i848.HomeProvider(homeRepo: gh<_i32.IHomeRepo>()));
    gh.factory<_i242.AuthProvider>(() => _i242.AuthProvider(
          repo: gh<_i1000.IAuthRepo>(),
          sharedPref: gh<_i630.ISharedPref>(),
        ));
    return this;
  }
}

class _$SharedPrefModules extends _i816.SharedPrefModules {}
