import 'package:flutter/material.dart';

import '../../../data/message/message.dart';
import 'theme/message_widget_style.dart';

class MessageWidget extends StatelessWidget {
  final IncomingMessage message;
  final void Function(IncomingMessage message)? onLongPress;
  final MessageWidgetStyle? style;

  const MessageWidget({super.key, required this.message, this.onLongPress, this.style});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    MessageWidgetStyle s = MessageWidgetStyle.def(theme);
    s = s.merge(theme.extension<MessageWidgetStyle>());
    s = s.merge(style);

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onLongPress: onLongPress != null ? _onLongPress : null,
        child: Padding(
          padding: s.contentPadding!,
          child: ConstrainedBox(
            constraints: s.constrains!,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Author(
                  author: message.author,
                  style: s.authorStyle,
                ),
                Padding(
                  padding: s.messagePadding!,
                  child: _Message(
                    message: message.message,
                    style: s.messageStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: _Date(
                    date: message.sendAt,
                    style: s.dateStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLongPress() {
    onLongPress!(message);
  }
}

class _Author extends StatelessWidget {
  final String author;
  final TextStyle? style;

  const _Author({super.key, required this.author, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$author:",
      style: style,
    );
  }
}

class _Message extends StatelessWidget {
  final String message;
  final TextStyle? style;

  const _Message({super.key, required this.message, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: style,
    );
  }
}

class _Date extends StatelessWidget {
  final DateTime date;
  final TextStyle? style;

  const _Date({super.key, required this.date, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      _convertDate(date),
      style: style,
    );
  }

  static String _convertDate(DateTime date) {
    int day = date.day;
    int month = date.month;
    int hour = date.hour;
    int min = date.minute;

    return "$day/$month $hour:$min";
  }
}
