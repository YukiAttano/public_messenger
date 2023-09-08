import 'package:flutter/material.dart';

class HighlightedIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;
  final bool highlighted;

  const HighlightedIconButton({super.key, required this.onPressed, required this.icon, this.highlighted = true});

  @override
  Widget build(BuildContext context) {

    Color highlightedColor = Theme.of(context).colorScheme.primary;

    return IconButton(
      onPressed: onPressed,
      icon: icon,
      color: highlighted ? highlightedColor : null,
    );
  }
}
