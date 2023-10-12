import 'package:flutter/material.dart';
import 'package:provider_template/navigation/route_constants.dart';
import 'package:provider_template/presentation/auth/login_screen.dart';
import 'package:provider_template/presentation/home/home_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final page = switch (settings.name) {
      RouteConstansts.root => const LoginScreen(),
      RouteConstansts.home => const HomeScreen(),
      _ => throw Exception('Invalid route')
    };
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
