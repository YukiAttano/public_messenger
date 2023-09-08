import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/app_user_snapshot/app_user_snapshot.dart';
import '../../../data/message/message.dart';
import '../../../logic/notifier/appuser_notifier.dart';
import '../../../logic/notifier/message_notifier.dart';
import 'message_input_field.dart';

class MessengerMessageInputField extends ConsumerStatefulWidget {
  const MessengerMessageInputField({super.key});

  @override
  ConsumerState<MessengerMessageInputField> createState() => _MessengerMessageInputFieldState();
}

class _MessengerMessageInputFieldState extends ConsumerState<MessengerMessageInputField> {
  String? _error;

  @override
  Widget build(BuildContext context) {
    return MessageInputField(
      onSend: _onSend,
      error: _error,
    );
  }

  Future<void> _onSend(String text) async {
    AppUserSnapshot userSnap = ref.read(appUserProvider);
    String t = text.trim();

    if (!userSnap.loggedIn) {
      setState(() => _error = "You must be logged in");
      return;
    } else if (t.isEmpty) {
      setState(() => _error = "Message cannot be empty");
      return;
    }

    String? error;
    OutgoingMessage message = OutgoingMessage(message: t, author: userSnap.appUser!.username, sendAt: DateTime.now());

    try {
      await ref.read(messageProvider.notifier).sendMessage(message);
    } on FirebaseException catch (e) {
      error = e.message;
    } finally {
      if (mounted) {
        setState(() => _error = error);
      }
    }
  }
}
