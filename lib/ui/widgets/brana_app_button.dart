import 'package:brana/ui/common/ui_helpers.dart';

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final bool busy;
  final Color? color;
  final bool enabled;
  final Widget? icon;
  final VoidCallback onPressed;
  final String title;
  final double width;
  final double height;
  final double borderRadius;

  const AppButton({
    super.key,
    this.busy = false,
    this.color,
    this.enabled = true,
    this.icon,
    required this.onPressed,
    required this.title,
    this.width = 40,
    this.height = 40,
    this.borderRadius = 5,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          GestureDetector(
            onTap: enabled && !busy ? onPressed : () {},
            child: InkWell(
              child: AnimatedContainer(
                height: height,
                width: width,
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.center,
                // padding: EdgeInsets.symmetric(
                //     horizontal: busy ? 10 : 24, vertical: busy ? 10 : 16),
                decoration: BoxDecoration(
                  color: enabled ? theme.primaryColor : theme.primaryColorLight,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: !busy
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          if (icon != null) icon!,
                          if (icon != null) horizontalSpaceSmall,
                          Text(
                            title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: enabled
                                  ? theme.primaryColorLight
                                  : theme.primaryColor,
                            ),
                          )
                        ],
                      )
                    : const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
              ),
            ),
          )
        ]),
      ],
    );
  }
}
