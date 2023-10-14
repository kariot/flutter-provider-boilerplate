// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:provider_template/commons/shared_pref/i_shared_pref.dart'
    as _i8;
import 'package:provider_template/commons/shared_pref/shared_pref.dart' as _i9;
import 'package:provider_template/di/modules/shared_pref_modules.dart' as _i12;
import 'package:provider_template/infrastructure/auth/auth_repo.dart' as _i5;
import 'package:provider_template/infrastructure/auth/i_auth_repo.dart' as _i4;
import 'package:provider_template/infrastructure/home/home_repo.dart' as _i7;
import 'package:provider_template/infrastructure/home/i_home_repo.dart' as _i6;
import 'package:provider_template/provider/auth_provider.dart' as _i10;
import 'package:provider_template/provider/home_provider.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPrefModules = _$SharedPrefModules();
    gh.singleton<_i3.FlutterSecureStorage>(sharedPrefModules.secureStorage);
    gh.factory<_i4.IAuthRepo>(() => _i5.AuthRepo());
    gh.factory<_i6.IHomeRepo>(() => _i7.HomeRepo());
    gh.factory<_i8.ISharedPref>(
        () => _i9.SharedPref(storage: gh<_i3.FlutterSecureStorage>()));
    gh.factory<_i10.AuthProvider>(() => _i10.AuthProvider(
          repo: gh<_i4.IAuthRepo>(),
          sharedPref: gh<_i8.ISharedPref>(),
        ));
    gh.factory<_i11.HomeProvider>(
        () => _i11.HomeProvider(homeRepo: gh<_i6.IHomeRepo>()));
    return this;
  }
}

class _$SharedPrefModules extends _i12.SharedPrefModules {}
