import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/message/message.dart';
import '../../../logic/notifier/appuser_notifier.dart';
import '../../../logic/notifier/message_notifier.dart';
import 'dialog/messenge_dialog.dart';
import 'message_list.dart';

class MessengerMessageList extends ConsumerWidget {
  const MessengerMessageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<IncomingMessage> messages = ref.watch(messageProvider.select((value) => value.messages));

    String? user = ref.watch(appUserProvider.select((value) => value.appUser?.username));

    return MessageList(
      messages: messages,
      onSelectOwnMessage: ref.read(messageProvider.notifier).deleteMessage,
      onSelectForeignerMessage: (message) async => showMessageDialog(context, message),
      user: user,
    );
  }
}
