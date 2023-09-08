import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String text;

  const ErrorText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Color errorColor = theme.colorScheme.error;

    TextStyle errorStyle = TextStyle(color: errorColor);

    return Text(
      text,
      style: errorStyle,
    );
  }
}
