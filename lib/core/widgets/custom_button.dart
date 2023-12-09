import 'package:flutter/material.dart';
import 'package:fun_chat/core/constants/colors.dart';
import 'package:go_router/go_router.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.pressed,
    required this.inactive,
    required this.background,
    required this.buttomText,
    required this.onPressed,
    super.key,
  });
  final String buttomText;
  final Color pressed;
  final Color inactive;
  final Color background;
  final VoidCallback onPressed;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith((states) {
          return const EdgeInsets.symmetric(horizontal: 20, vertical: 15);
        }),
        shape: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: KColors.primaryColor,
                  ));
            }
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            );
          },
        ),
        splashFactory: NoSplash.splashFactory,
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return widget.pressed;
            }
            return widget.background;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return widget.background;
            }
            return widget.pressed;
          },
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.buttomText,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
