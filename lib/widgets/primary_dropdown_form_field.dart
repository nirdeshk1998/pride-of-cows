import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/widget_styles.dart';

class PrimaryDropdownFormField extends StatelessWidget {
  final String label;
  final List list;
  final void Function(dynamic)? onChanged;

  const PrimaryDropdownFormField({
    Key? key,
    required this.label,
    this.onChanged,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      padding: EdgeInsets.zero,
      child: DropdownButtonFormField(
        icon: SvgPicture.asset(Assets.assetsIconsChevronDownThin),
        iconSize: 12,
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
          ),
          floatingLabelStyle: TextStyle(
            color: Palette.hintColor,
            fontFamily: GoogleFonts.lato().fontFamily,
            fontSize: 18,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
          ),
          border: WidgetStyle.inputBorder,
          enabledBorder: WidgetStyle.inputBorder,
          focusedBorder: WidgetStyle.activeInputBorder,
        ),
        onChanged: onChanged,
        items: list
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
      ),
    );
  }
}

class DropdownFormField extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem<int>>? items;
  final void Function(int?)? onChanged;
  const DropdownFormField({
    Key? key,
    required this.label,
    this.onChanged,
    this.items,
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
      items: items,
      onChanged: onChanged,
    );
  }
}
