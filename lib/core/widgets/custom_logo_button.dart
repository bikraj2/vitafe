import 'package:flutter/material.dart';

class LogoButton extends StatefulWidget {
  const LogoButton({
    required this.imagePath,
    required this.radius,
    required this.onPressed,
    required this.borderColor,
    super.key,
  });
  final String imagePath;
  final double radius;
  final VoidCallback onPressed;
  final Color borderColor;
  @override
  State<LogoButton> createState() => _LogoButtonState();
}

class _LogoButtonState extends State<LogoButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: widget.radius * 2 + 20,
        height: widget.radius * 2 + 20,
        decoration: BoxDecoration(
          border: Border.all(color: widget.borderColor),
          borderRadius: BorderRadius.circular(widget.radius + 10),
        ),
        child: Image.asset(
          'assets/logos/icons/${widget.imagePath}',
        ),
      ),
    );
  }
}
