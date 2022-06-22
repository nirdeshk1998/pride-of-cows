import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/styles/colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: const StadiumBorder(),
      color: Palette.primaryColor,
      textColor: Palette.onPrimaryColor,
      disabledColor: Palette.disabledColor,
      disabledTextColor: Palette.onDisabledColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      elevation: 0,
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontFamily: GoogleFonts.lato().fontFamily,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.72,
        ),
      ),
    );
  }
}

class PrimaryIconButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final String svg;
  final double? height, width;
  final EdgeInsets? padding;

  const PrimaryIconButton({
    Key? key,
    this.onPressed,
    required this.svg,
    this.height,
    this.width,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: padding ?? EdgeInsets.zero,
      onPressed: onPressed,
      child: SvgPicture.asset(
        svg,
        height: height ?? 24,
        width: width ?? 24,
        fit: BoxFit.contain,
      ),
    );
  }
}

class PrimaryTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const PrimaryTextButton({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Color(0xff193b61),
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.72,
        ),
      ),
    );
  }
}
