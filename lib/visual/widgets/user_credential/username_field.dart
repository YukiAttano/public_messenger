
import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {

  final TextEditingController? controller;

  const UsernameField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: "Username"),
    );
  }
}
