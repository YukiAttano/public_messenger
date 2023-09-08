import 'package:flutter/material.dart';

import '../../../../data/message/message.dart';
import '../message_widget.dart';
import '../theme/message_widget_style.dart';

Future<void> showMessageDialog(BuildContext context, IncomingMessage message) async {
  await showDialog(
    context: context,
    builder: (context) {
      return MessageDialog(message: message);
    },
  );
}

class MessageDialog extends StatelessWidget {
  final IncomingMessage message;

  const MessageDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MessageWidget(
        message: message,
        style: const MessageWidgetStyle(
          constrains: BoxConstraints.tightFor(),
        ),
      ),
    );
  }
}
