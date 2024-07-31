import 'package:flutter/material.dart';

enum CustomButtonVariants { primary, secondary, terciary }

class CustomButton extends StatelessWidget {
  final String text;
  final CustomButtonVariants variant;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final bool showText;
  final bool showLeftIcon;
  final bool showRightIcon;

  const CustomButton({
    super.key,
    required this.variant,
    this.text = '',
    this.leftIcon = Icons.access_time,
    this.rightIcon = Icons.access_time,
    this.showText = true,
    this.showLeftIcon = false,
    this.showRightIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color backgroundColor;
    Color textColor;

    switch (variant) {
      case CustomButtonVariants.primary:
        borderColor = Colors.transparent;
        backgroundColor = const Color(0xFF006FFD);
        textColor = Colors.white;
      case CustomButtonVariants.secondary:
        borderColor = const Color(0xFF006FFD);
        backgroundColor = Colors.transparent;
        textColor = const Color(0xFF006FFD);
      case CustomButtonVariants.terciary:
        borderColor = Colors.transparent;
        backgroundColor = Colors.transparent;
        textColor = const Color(0xFF006FFD);
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      constraints: const BoxConstraints(minHeight: 40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showLeftIcon != false)
            Icon(
              leftIcon,
              color: textColor,
              size: 12,
            ),
          if (showLeftIcon != false) const SizedBox(width: 8),
          if (showText) Text(text, style: TextStyle(color: textColor)),
          if (showRightIcon != false) const SizedBox(width: 8),
          if (showRightIcon != false)
            Icon(
              rightIcon,
              color: textColor,
              size: 12,
            ),
        ],
      ),
    );
  }
}
