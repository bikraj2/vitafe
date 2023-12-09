import 'package:flutter/material.dart';

class IField extends StatelessWidget {
  const IField({
    required this.controller,
    this.filled = false,
    this.obscureText = false,
    this.readonly = false,
    super.key,
    this.validator,
    this.fillcolour,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.overrideValidator = true,
    this.hintStyle,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool filled;
  final Color? fillcolour;
  final bool obscureText;
  final bool readonly;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        validator: overrideValidator
            ? validator
            : (value) {
                if (value == null || value.isEmpty)
                  return 'This field is required';
              },
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        keyboardType: keyboardType,
        obscureText: obscureText,
        obscuringCharacter: '#',
        readOnly: readonly,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          contentPadding: const EdgeInsets.all(20),
          filled: filled,
          fillColor: fillcolour,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
