
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {

  final TextEditingController? controller;

  const EmailField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: "E-Mail"),
    );
  }
}
