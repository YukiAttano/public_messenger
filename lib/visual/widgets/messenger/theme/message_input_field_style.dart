//ignore_for_file: avoid_returning_this

import 'dart:ui';

import 'package:flutter/material.dart';

class MessageInputFieldStyle extends ThemeExtension<MessageInputFieldStyle> {
  final InputDecorationTheme? inputDecorationTheme;

  const MessageInputFieldStyle({this.inputDecorationTheme});

  factory MessageInputFieldStyle.def() {
    return const MessageInputFieldStyle(
      inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
    );
  }

  @override
  MessageInputFieldStyle copyWith({InputDecorationTheme? inputDecorationTheme}) {
    return MessageInputFieldStyle(
      inputDecorationTheme: inputDecorationTheme ?? this.inputDecorationTheme,
    );
  }

  MessageInputFieldStyle merge(MessageInputFieldStyle? other) {
    if (other == null) {
      return this;
    }

    return copyWith(
      inputDecorationTheme: other.inputDecorationTheme,
    );
  }

  @override
  MessageInputFieldStyle lerp(ThemeExtension<MessageInputFieldStyle>? other, double t) {
    if (other is! MessageInputFieldStyle) return this;

    return MessageInputFieldStyle(
      inputDecorationTheme: other.inputDecorationTheme,
    );
  }
}
