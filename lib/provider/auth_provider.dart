import 'package:provider_template/commons/shared_pref/i_shared_pref.dart';
import 'package:provider_template/infrastructure/auth/i_auth_repo.dart';

class AuthProvider {
  IAuthRepo repo;
  ISharedPref sharedPref;
  AuthProvider({
    required this.repo,
    required this.sharedPref,
  });
}
