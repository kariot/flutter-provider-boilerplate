import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider_template/di/injection.dart';
import 'package:provider_template/navigation/app_routes.dart';
import 'package:provider_template/navigation/route_constants.dart';
import 'package:provider_template/provider/auth_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => GetIt.instance.get<AuthProvider>())
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: appRoutes,
      initialRoute: RouteConstansts.root,
    );
  }
}
