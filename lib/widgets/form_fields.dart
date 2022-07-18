import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/widget_styles.dart';

class PrimaryTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;

  const PrimaryTextFormField({
    Key? key,
    this.label,
    this.controller,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        constraints: const BoxConstraints(maxHeight: 50, minHeight: 50),
        labelText: '$label',
        hintText: hint!=null?'$hint':"",
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
    );
  }
}
