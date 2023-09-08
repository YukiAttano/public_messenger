import '../message/message.dart';

class MessageSnapshot {
  final List<IncomingMessage> messages;

  const MessageSnapshot({required this.messages});

  const MessageSnapshot.empty() : this(messages: const []);

  MessageSnapshot copyWith(List<IncomingMessage>? messages) {
    return MessageSnapshot(messages: messages ?? this.messages);
  }
}
