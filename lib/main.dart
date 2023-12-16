import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_template/commons/shared_pref/i_shared_pref.dart';
import 'package:provider_template/di/injection.dart';
import 'package:provider_template/navigation/app_routes.dart';
import 'package:provider_template/navigation/navigation_utils.dart';
import 'package:provider_template/navigation/route_constants.dart';
import 'package:provider_template/provider/auth_provider.dart';
import 'package:provider_template/provider/home_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final isLoggedIn = await isSessionAvailable();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => getIt<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => getIt<HomeProvider>()),
    ],
    child: MainApp(
      initialRoute: isLoggedIn ? RouteConstansts.home : RouteConstansts.root,
    ),
  ));
}

class MainApp extends StatelessWidget {
  final String initialRoute;
  const MainApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigationUtils.navKey,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: initialRoute,
    );
  }
}

Future<bool> isSessionAvailable() async {
  final loginData = await getIt<ISharedPref>().getLoginData();
  final token = loginData?.token ?? '';
  return token.isNotEmpty;
}
