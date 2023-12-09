import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  EdgeInsets get padding => mediaQuery.padding;
  Size get size => mediaQuery.size;
  double get height => size.height;
  double get width => size.width;
}
