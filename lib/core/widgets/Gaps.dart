import 'package:flutter/material.dart';

class VerticalGap extends StatelessWidget {
  const VerticalGap({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class HorizontalGap extends StatelessWidget {
  const HorizontalGap({required this.width, super.key});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
