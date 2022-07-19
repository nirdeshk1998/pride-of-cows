import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/styles/colors.dart';

class TextType {
  static TextStyle calender = TextStyle(
    fontSize: TextSize.regularSmall,
    fontWeight: FontWeight.bold,
    color: Palette.textColor,
    fontFamily: GoogleFonts.lato().fontFamily,
  );

  static TextStyle regular = TextStyle(
    fontSize: TextSize.regular,
    fontFamily: GoogleFonts.lato().fontFamily,
  );

  static TextStyle titleStyled = TextStyle(
    fontFamily: GoogleFonts.suranna().fontFamily,
    fontSize: TextSize.title,
    height: 1,
  );

  static TextStyle header = TextStyle(
    fontFamily: GoogleFonts.suranna().fontFamily,
    fontSize: TextSize.header,
    height: 1.4,
  );

  static TextStyle header2 = TextStyle(
    fontFamily: GoogleFonts.suranna().fontFamily,
    fontSize: TextSize.header2,
    height: 1,
  );

  static TextStyle title = TextStyle(
    fontFamily: GoogleFonts.lato().fontFamily,
    fontSize: TextSize.subHeader,
    fontWeight: FontWeight.bold,
    height: 1,
  );

  static TextStyle subtitle = TextStyle(
    fontFamily: GoogleFonts.lato().fontFamily,
    fontSize: TextSize.subHeader,
    fontWeight: FontWeight.normal,
    height: 1,
  );

  static TextStyle primaryButton = TextStyle(
    fontFamily: GoogleFonts.lato().fontFamily,
    fontSize: TextSize.primaryButton,
    fontWeight: FontWeight.bold,
    height: 1,
  );

  static TextStyle primaryTextButton = TextStyle(
    fontFamily: GoogleFonts.lato().fontFamily,
    fontSize: TextSize.primaryButton,
    height: 1,
  );

  static TextStyle isLabel = TextStyle(
    fontFamily: GoogleFonts.lato().fontFamily,
    fontSize: TextSize.hint,
    height: 1,
    color: Palette.hintColor,
  );

  static TextStyle isNotLabel = TextStyle(
    fontFamily: GoogleFonts.lato().fontFamily,
    fontSize: TextSize.regular,
    height: 1,
    color: Palette.hintColor,
  );
}

class TextSize {
  static const double regularSmall = 12;
  static const double regular = 14;
  static const double subHeader = 16;
  static const double title = 20;
  static const double header = 32;
  static const double header2 = 24;
  static const double appbarTitle = 20;
  static const double primaryButton = 12;
  static const double textButton = 14;
  static const double menuTitle = 16;
  static const double hint = 16;
}

// class TextWeight {
//   static const FontWeight regular = normal;
//   static const FontWeight header = bold;
//   static const FontWeight appbarTitle = medium;

//   static const FontWeight thin = FontWeight.w100;
//   static const FontWeight extraLight = FontWeight.w200;
//   static const FontWeight light = FontWeight.w300;
//   static const FontWeight normal = FontWeight.w400;
//   static const FontWeight medium = FontWeight.w500;
//   static const FontWeight semiBold = FontWeight.w600;
//   static const FontWeight bold = FontWeight.w700;
//   static const FontWeight extraBold = FontWeight.w800;
//   static const FontWeight black = FontWeight.w900;
// }

class TextView extends StatelessWidget {
  final String? text;
  final Color? color, bgColor;
  final TextStyle? textType;
  final double? size, letterSpacing, height, boxHeight;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final int? maxLines;

  const TextView(
    this.text, {
    Key? key,
    this.color,
    this.size,
    this.fontWeight,
    this.textType,
    this.letterSpacing,
    this.height,
    this.textAlign,
    this.boxHeight,
    this.bgColor,
    this.decoration,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      height: boxHeight,
      child: DefaultTextStyle(
        style: textType ?? TextType.regular,
        child: Text(
          '$text',
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: size,
            color: color ?? Palette.primaryColor,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            height: height,
            decoration: decoration,
          ),
        ),
      ),
    );
  }
}
