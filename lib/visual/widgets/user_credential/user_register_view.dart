import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ux_improvements/ux_improvements.dart';

import '../../../logic/routing/main_route.dart';
import '../../../logic/routing/routes/login_route.dart';
import '../error_text.dart';
import '../gap.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'username_field.dart';

class UserRegisterView extends StatefulWidget {
  final FutureOr<void> Function(String email, String username, String password)? onRegister;

  const UserRegisterView({super.key, this.onRegister});

  @override
  State<UserRegisterView> createState() => _UserRegisterViewState();
}

class _UserRegisterViewState extends State<UserRegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController = TextEditingController();

  String? _passwordError;
  String _registerError = "";
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Register"),
      actions: [
        TextButton(
          onPressed: () => const LoginRoute().go(context),
          child: const Text("Login?"),
        ),
        OutlinedButton(
          onPressed: widget.onRegister != null ? _onPressed : null,
          child: const Text("Register"),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EmailField(
            controller: _emailController,
          ),
          UsernameField(
            controller: _usernameController,
          ),
          PasswordField(
            controller: _passwordController,
            errorText: _passwordError,
          ),
          PasswordField(
            controller: _passwordCheckController,
            errorText: _passwordError,
          ),
          const Gap(),
          FakeloadingWidget(
            replacement: const LinearProgressIndicator(),
            loading: _isLoading,
            child: ErrorText(_registerError),
          ),
        ],
      ),
    );
  }

  Future<void> _onPressed() async {
    setState(() => _isLoading = true);

    String email = _emailController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;
    String passwordCheck = _passwordCheckController.text;

    String? passwordError;
    String registerError = "";

    try {
      if (password == passwordCheck) {
        await widget.onRegister!(email, username, password);
      } else {
        passwordError = "The passwords are not equal";
      }
    } on FirebaseException catch (e) {
      registerError = e.message ?? "Error";
    } finally {
      if (mounted) {
        setState(() {
          _passwordError = passwordError;
          _registerError = registerError;
          _isLoading = false;
        });
      }
    }
  }
}
