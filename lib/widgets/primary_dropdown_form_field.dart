import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/widget_styles.dart';

class PrimaryDropdownFormField extends StatelessWidget {
  final String label;
  final void Function(int?) ? onChanged;
  const PrimaryDropdownFormField({
    Key? key, required this.label,
    this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        constraints: const BoxConstraints(maxHeight: 50, minHeight: 50),
        labelText: label,
        prefixIconConstraints: const BoxConstraints(),
        labelStyle: TextStyle(
          color: Palette.hintColor,
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 16,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1.5,
        ),
        floatingLabelStyle: TextStyle(
          color: Palette.hintColor,
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 18,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1.5,
        ),
        border: WidgetStyle.inputBorder,
        enabledBorder: WidgetStyle.inputBorder,
        focusedBorder: WidgetStyle.activeInputBorder,
      ),
      items: const [
        DropdownMenuItem(value: 0, child: Text('Male')),
        DropdownMenuItem(value: 1, child: Text('Female')),
      ],
      onChanged:onChanged,
    );
  }
}
