import 'package:flutter/material.dart';

import '../../../data/message/message.dart';
import 'message_widget.dart';

class MessageList extends StatelessWidget {
  final List<IncomingMessage> messages;
  final int _messageCount;
  final String? user;
  final void Function(IncomingMessage message)? onSelectOwnMessage;
  final void Function(IncomingMessage message)? onSelectForeignerMessage;

  const MessageList({super.key, required this.messages, this.user, this.onSelectOwnMessage, this.onSelectForeignerMessage}) : _messageCount = messages.length;

  static const bool _reverse = true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: _reverse,
      itemCount: _messageCount,
      itemBuilder: (context, index) {
        index = _getIndex(index);

        IncomingMessage message = messages[index];

        bool ownMessage = user == message.author;

        return Align(
          alignment: ownMessage ? Alignment.centerRight : Alignment.centerLeft,
          child: MessageWidget(message: message, onLongPress: ownMessage ? onSelectOwnMessage : onSelectForeignerMessage),
        );
      },
    );
  }

  int _getIndex(int index) {
    if (_reverse) {
      return _messageCount - 1 - index;
    } else {
      return index;
    }
  }
}
