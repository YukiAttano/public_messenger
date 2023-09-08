import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ux_improvements/ux_improvements.dart';

import '../../../logic/routing/main_route.dart';
import '../../../logic/routing/routes/register_route.dart';
import '../error_text.dart';
import '../gap.dart';
import 'email_field.dart';
import 'password_field.dart';

class UserLoginView extends StatefulWidget {
  final FutureOr<void> Function(String email, String password)? onLogin;

  const UserLoginView({super.key, this.onLogin});

  @override
  State<UserLoginView> createState() => _UserLoginViewState();
}

class _UserLoginViewState extends State<UserLoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String _loginError = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Login"),
      actions: [
        OutlinedButton(
          onPressed: widget.onLogin != null ? _onLogin : null,
          child: const Text("Login"),
        ),
        TextButton(
          onPressed: () => const RegisterRoute().go(context),
          child: const Text("No Account yet?"),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EmailField(
            controller: _emailController,
          ),
          PasswordField(
            controller: _passwordController,
          ),
          const Gap(),
          FakeloadingWidget(
            replacement: const LinearProgressIndicator(),
            loading: _isLoading,
            child: ErrorText(_loginError),
          ),
        ],
      ),
    );
  }

  Future<void> _onLogin() async {

    setState(() => _isLoading = true);

    String email = _emailController.text;
    String password = _passwordController.text;

    String loginError = "";

    try {
      await widget.onLogin!(email, password);
    } on FirebaseException catch (e) {
      loginError = e.message ?? "Error";
    }

    if (mounted)
    {
      setState(() {
        _loginError = loginError;
        _isLoading = false;
      });
    }

  }
}
