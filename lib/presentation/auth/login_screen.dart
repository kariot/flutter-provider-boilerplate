import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/domain/auth/login_response/login_response.dart';
import 'package:provider_template/presentation/common/common_widget_props.dart';
import 'package:provider_template/presentation/common/primary_button.dart';
import 'package:provider_template/presentation/common/snackbar_utils.dart';
import 'package:provider_template/presentation/common/textfield_validators.dart';
import 'package:provider_template/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthProvider provider;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'kminchelle');
  final _passwordController = TextEditingController(text: '0lelplR');
  @override
  void initState() {
    provider = GetIt.instance.get<AuthProvider>();
    provider.loginUser('', '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Login',
            ),
          ),
          body: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 6,
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        validator: getUsernameValidator,
                        keyboardType: TextInputType.name,
                        decoration: getInputDecoration('Enter you username'),
                      ),
                      vSpacer20,
                      TextFormField(
                        controller: _passwordController,
                        validator: getPasswordValidator,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: getInputDecoration('Enter you password'),
                      ),
                      vSpacer20,
                      PrimaryButton(onPressed: _onPressSignIn, title: 'Sign in')
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onPressSignIn() async {
    if (_formKey.currentState?.validate() != true) {
      return;
    }
    final username = _usernameController.text.toString();
    final password = _passwordController.text.toString();
    final response = await provider.loginUser(username, password);
    response.fold((l) => _handleAuthFailure(l), (r) => _handleAuthSuccess(r));
  }

  _handleAuthFailure(ApiFailure l) => showErrorSnack(context, l.message);

  _handleAuthSuccess(LoginResponse r) {}
}
