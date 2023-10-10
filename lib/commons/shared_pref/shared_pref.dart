import 'package:injectable/injectable.dart';
import 'package:provider_template/commons/shared_pref/i_shared_pref.dart';

@Injectable(as: ISharedPref)
class SharedPref extends ISharedPref {
  @override
  Future<String> getAccessToken() async {
    return "";
  }
}
