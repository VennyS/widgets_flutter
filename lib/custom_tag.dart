import 'package:flutter/material.dart';

enum CustomTagVariants { enabled, disabled }

class CustomTag extends StatefulWidget {
  final String text;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final CustomTagVariants initialState;
  final bool showText;
  final bool showLeftIcon;
  final bool showRightIcon;

  const CustomTag({
    super.key,
    required this.text,
    this.leftIcon,
    this.rightIcon,
    this.initialState = CustomTagVariants.disabled,
    this.showText = true,
    this.showLeftIcon = false,
    this.showRightIcon = false,
  });

  @override
  CustomTagState createState() => CustomTagState();
}

class CustomTagState extends State<CustomTag> {
  late CustomTagVariants _state;

  @override
  void initState() {
    super.initState();
    _state = widget.initialState;
  }

  void _toggleState() {
    setState(() {
      _state = _state == CustomTagVariants.disabled
          ? CustomTagVariants.enabled
          : CustomTagVariants.disabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _state == CustomTagVariants.disabled
        ? const Color(0xFFEAF2FF)
        : const Color(0xFF006FFD);
    Color textColor = _state == CustomTagVariants.disabled
        ? const Color(0xFF006FFD)
        : Colors.white;

    return GestureDetector(
      onTap: _toggleState,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: const BoxConstraints(
          minHeight: 24,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.showLeftIcon)
              Icon(
                widget.leftIcon,
                color: textColor,
                size: 12,
              ),
            if (widget.showLeftIcon) const SizedBox(width: 8),
            if (widget.showText)
              Center(
                  child: Text(widget.text, style: TextStyle(color: textColor))),
            if (widget.showRightIcon) const SizedBox(width: 8),
            if (widget.showRightIcon)
              Icon(
                widget.rightIcon,
                color: textColor,
                size: 12,
              ),
          ],
        ),
      ),
    );
  }
}
