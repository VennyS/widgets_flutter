import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum CustomButtonVariants { primary, secondary, terciary }

class CustomButton extends StatelessWidget {
  final String text;
  final CustomButtonVariants variant;
  final SvgPicture? leftSvg;
  final SvgPicture? rightSvg;
  final bool showText;
  final bool showLeftSvg;
  final bool showRightSvg;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.variant,
    required this.onPressed,
    this.text = '',
    this.leftSvg,
    this.rightSvg,
    this.showText = true,
    this.showLeftSvg = false,
    this.showRightSvg = false,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color backgroundColor;
    Color textColor;

    switch (variant) {
      case CustomButtonVariants.primary:
        borderColor = Colors.transparent;
        backgroundColor = Theme.of(context).primaryColor;
        textColor = Colors.white;
        break;
      case CustomButtonVariants.secondary:
        borderColor = Theme.of(context).primaryColor;
        backgroundColor = Colors.transparent;
        textColor = Theme.of(context).primaryColor;
        break;
      case CustomButtonVariants.terciary:
        borderColor = Colors.transparent;
        backgroundColor = Colors.transparent;
        textColor = Theme.of(context).primaryColor;
        break;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        constraints: const BoxConstraints(minHeight: 40),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildChildren(textColor),
        ),
      ),
    );
  }

  List<Widget> _buildChildren(Color textColor) {
    List<Widget> children = [];

    if (showLeftSvg && leftSvg != null) {
      children.add(leftSvg!);
      children.add(const SizedBox(width: 8));
    }

    if (showText) {
      children.add(
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      );
    }

    if (showRightSvg && rightSvg != null) {
      if (showText) {
        children.add(const SizedBox(width: 8));
      }
      children.add(rightSvg!);
    }

    return children;
  }
}
