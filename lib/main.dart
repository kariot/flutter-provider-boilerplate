import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_template/di/injection.dart';
import 'package:provider_template/navigation/app_routes.dart';
import 'package:provider_template/navigation/route_constants.dart';
import 'package:provider_template/provider/auth_provider.dart';
import 'package:provider_template/provider/home_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => getIt<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => getIt<HomeProvider>()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RouteConstansts.root,
    );
  }
}
