import 'package:flutter/material.dart';

class EmojiRow extends StatelessWidget {
  const EmojiRow({super.key, required this.onChange});

  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ['😀', '😃', '😄', '😁', '😆', '😅', '😂', '🤣'].map((e) {
        return GestureDetector(
          onTap: () => onChange(e),
          child: Text(e, style: theme.textTheme.titleLarge),
        );
      }).toList(),
    );
  }
}
