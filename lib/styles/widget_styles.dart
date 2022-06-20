import 'package:flutter/material.dart';
import 'package:poc/styles/colors.dart';

class WidgetStyle {
  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(100),
    borderSide: const BorderSide(color: Palette.surfaceColor),
  );
  static OutlineInputBorder activeInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(100),
    borderSide: const BorderSide(color: Palette.primaryColor),
  );
}
