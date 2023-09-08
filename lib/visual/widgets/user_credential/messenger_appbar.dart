import 'package:flutter/material.dart';

class MessengerAppBar extends StatelessWidget implements PreferredSizeWidget{

  final Widget leading;
  final Widget? title;
  final List<Widget>? actions;

  const MessengerAppBar({super.key, this.leading = const SizedBox.shrink(), this.title = const Text("Messenger"), this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
