import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? errorText;

  const PasswordField({super.key, this.controller, this.obscureText = true, this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: "Password",
        errorText: errorText,
      ),
    );
  }
}
