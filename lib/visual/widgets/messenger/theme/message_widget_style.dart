//ignore_for_file: avoid_returning_this

import 'package:flutter/material.dart';

class MessageWidgetStyle extends ThemeExtension<MessageWidgetStyle> {
  final EdgeInsets? contentPadding;
  final EdgeInsets? messagePadding;
  final BoxConstraints? constrains;

  final TextStyle? authorStyle;
  final TextStyle? messageStyle;
  final TextStyle? dateStyle;

  const MessageWidgetStyle({
    this.contentPadding,
    this.messagePadding,
    this.constrains,
    this.authorStyle,
    this.messageStyle,
    this.dateStyle,
  });

  factory MessageWidgetStyle.def(ThemeData theme) {
    TextStyle? authorStyle = theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic);
    TextStyle? messageStyle = theme.textTheme.bodyMedium;
    TextStyle? dateStyle = theme.textTheme.labelSmall;

    return MessageWidgetStyle(
      contentPadding: const EdgeInsets.all(8),
      messagePadding: const EdgeInsets.all(5),
      constrains: const BoxConstraints(maxWidth: 250, minWidth: 100),
      authorStyle: authorStyle,
      messageStyle: messageStyle,
      dateStyle: dateStyle,
    );
  }

  @override
  MessageWidgetStyle copyWith({
    EdgeInsets? contentPadding,
    EdgeInsets? messagePadding,
    BoxConstraints? constrains,
    TextStyle? authorStyle,
    TextStyle? messageStyle,
    TextStyle? dateStyle,
  }) {
    return MessageWidgetStyle(
      contentPadding: contentPadding ?? this.contentPadding,
      messagePadding: messagePadding ?? this.messagePadding,
      constrains: constrains ?? this.constrains,
      authorStyle: authorStyle ?? this.authorStyle,
      messageStyle: messageStyle ?? this.messageStyle,
      dateStyle: dateStyle ?? this.dateStyle,
    );
  }

  MessageWidgetStyle merge(MessageWidgetStyle? other) {
    if (other == null) {
      return this;
    }

    return copyWith(
      contentPadding: other.contentPadding,
      messagePadding: other.messagePadding,
      constrains: other.constrains,
      authorStyle: other.authorStyle,
      messageStyle: other.messageStyle,
      dateStyle: other.dateStyle,
    );
  }

  @override
  MessageWidgetStyle lerp(ThemeExtension<MessageWidgetStyle>? other, double t) {
    if (other is! MessageWidgetStyle) return this;

    return MessageWidgetStyle(
      contentPadding: EdgeInsets.lerp(contentPadding, other.contentPadding, t),
      messagePadding: EdgeInsets.lerp(messagePadding, other.messagePadding, t),
      constrains: BoxConstraints.lerp(constrains, other.constrains, t),
      authorStyle: TextStyle.lerp(authorStyle, other.authorStyle, t),
      messageStyle: TextStyle.lerp(messageStyle, other.messageStyle, t),
      dateStyle: TextStyle.lerp(dateStyle, other.dateStyle, t),
    );
  }
}
