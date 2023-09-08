import 'dart:async';

import 'package:flutter/material.dart';

import '../highlighted_icon_button.dart';
import 'theme/message_input_field_style.dart';

class MessageInputField extends StatefulWidget {
  final FutureOr<void> Function(String text)? onSend;
  final String? error;
  final MessageInputFieldStyle? style;

  const MessageInputField({super.key, this.onSend, this.error, this.style});

  @override
  State<MessageInputField> createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  final TextEditingController _controller = TextEditingController();
  String? _error;

  @override
  void initState() {
    super.initState();

    _initError();
  }

  @override
  void didUpdateWidget(covariant MessageInputField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.error != widget.error) _initError();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    MessageInputFieldStyle style = MessageInputFieldStyle.def();
    style = style.merge(theme.extension<MessageInputFieldStyle>());
    style = style.merge(widget.style);

    return Row(
      children: [
        Flexible(
          child: Theme(
            data: theme.copyWith(inputDecorationTheme: style.inputDecorationTheme),
            child: _MessageField(
              controller: _controller,
              error: _error,
              onEditingComplete: _onSend,
            ),
          ),
        ),
        const VerticalDivider(),
        HighlightedIconButton(
          onPressed: widget.onSend != null ? _onSend : null,
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }

  Future<void> _onSend() async {
    await widget.onSend!.call(_controller.text);

    _controller.text = "";
  }

  void _initError() {
    _error = widget.error;
  }
}

class _MessageField extends StatelessWidget {
  final TextEditingController? controller;
  final String? error;
  final void Function()? onEditingComplete;

  const _MessageField({super.key, this.controller, this.error, this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 1,
      maxLines: 4,
      textInputAction: TextInputAction.send,
      decoration: InputDecoration(
        labelText: "Message",
        errorText: error,
      ),
      onEditingComplete: onEditingComplete,
    );
  }
}
