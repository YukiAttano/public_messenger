import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/message/message.dart';
import '../../data/message_snapshot/message_snapshot.dart';
import '../../data/snapshot_reporter/snapshot_reporter.dart';
import '../network/message_handler.dart';

final messageProvider = StateNotifierProvider<MessageNotifier, MessageSnapshot>((ref) => MessageNotifier());

class MessageNotifier extends StateNotifier<MessageSnapshot> {
  late StreamSubscription<SnapshotReporter<IncomingMessage>> _messageStream;
  static const int _messageCount = 20;

  MessageNotifier() : super(const MessageSnapshot.empty())
  {
    _init();
  }

  void _init() {
    _messageStream = MessageHandler.getMessageStream(_messageCount).listen(_handleIncomingMessages);
  }

  Future<void> sendMessage(OutgoingMessage message) async
  {
    await MessageHandler.sendMessage(message);
  }

  Future<void> deleteMessage(IncomingMessage message) async
  {
    await MessageHandler.deleteMessage(message.id);
  }

  void _handleIncomingMessages(SnapshotReporter<IncomingMessage> reporter) {
    List<IncomingMessage> messages = List.of(state.messages);

    switch (reporter.type) {
      case DocumentChangeType.added:
        messages.add(reporter.snapshot!);
      case DocumentChangeType.modified:
        _replaceOrAdd(messages, reporter.snapshot!);
      case DocumentChangeType.removed:
        messages.removeWhere((element) => element.id == reporter.id);
    }

    state = state.copyWith(messages);
  }

  void _replaceOrAdd(List<IncomingMessage> list, IncomingMessage replace) {
    bool replaced = false;
    int maxZaehler = list.length;
    for (int zaehler = 0; zaehler != maxZaehler; zaehler++) {
      if (list[zaehler].id == replace.id) {
        list[zaehler] = replace;
        replaced = true;
        break;
      }
    }

    if (!replaced) {
      list.add(replace);
    }
  }

  @override
  Future<void> dispose() async {
    await _messageStream.cancel();
    super.dispose();
  }
}
