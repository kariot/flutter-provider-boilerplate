import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider_template/di/injection.dart';
import 'package:provider_template/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthProvider provider;
  @override
  void initState() {
    provider = GetIt.instance.get<AuthProvider>();
    provider.loginUser('', '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
