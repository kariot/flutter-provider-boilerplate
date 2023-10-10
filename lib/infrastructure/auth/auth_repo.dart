import 'package:injectable/injectable.dart';
import 'package:provider_template/infrastructure/auth/i_auth_repo.dart';
import 'package:provider_template/infrastructure/base/base_repo.dart';

@Injectable(as: IAuthRepo)
class AuthRepo extends IAuthRepo with BaseRepo {}
