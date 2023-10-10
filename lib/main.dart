import 'package:flutter/material.dart';
import 'package:provider_template/di/injection.dart';
import 'package:provider_template/navigation/app_routes.dart';
import 'package:provider_template/navigation/route_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MainApp());
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
