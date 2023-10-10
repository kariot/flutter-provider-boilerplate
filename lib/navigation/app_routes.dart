import 'package:flutter/material.dart';
import 'package:provider_template/navigation/route_constants.dart';
import 'package:provider_template/presentation/auth/login_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  RouteConstansts.root: (context) => const LoginScreen(),
};
