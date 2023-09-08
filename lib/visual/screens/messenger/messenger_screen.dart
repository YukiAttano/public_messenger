import 'package:flutter/material.dart';

import '../../widgets/gap.dart';
import '../../widgets/messenger/messenger_message_input_field.dart';
import '../../widgets/messenger/messenger_message_list.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: MessengerMessageList(),
        ),
        Gap(),
        MessengerMessageInputField(),
      ],
    );
  }
}
