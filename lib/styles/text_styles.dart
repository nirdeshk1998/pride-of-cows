import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/styles/colors.dart';

class TextStyles {
  static TextStyle hint = TextStyle(
    color: Palette.hintColor,
    fontFamily: GoogleFonts.lato().fontFamily,
    fontSize: 16,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static TextStyle header = TextStyle(
    color: Palette.textColor,
    fontFamily: GoogleFonts.suranna().fontFamily,
    fontSize: 32,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );
  static TextStyle subheader=TextStyle(
    color: Palette.textColor,
    fontFamily: GoogleFonts.suranna().fontFamily,
    fontSize: 18,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
  );
}
