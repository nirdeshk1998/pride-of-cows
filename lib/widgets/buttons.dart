import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/widgets/text_view.dart';

class PrimaryOutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool? isFilled;
  final double? letterSpacing;

  const PrimaryOutlineButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isFilled,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(10.0),
      minWidth: 0,
      height: 36,
      color: isFilled == true ? Palette.primaryColor : Palette.scaffoldBackgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: isFilled == true ? Palette.primaryColor : Palette.outlineColor,
        ),
      ),
      child: TextView(
        title.toUpperCase(),
        textType: TextType.primaryButton,
        height: 1.2,
        letterSpacing: letterSpacing,
        color: isFilled == true ? Palette.onPrimaryColor : Palette.primaryColor,
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final String? icon;
  final double? iconSize, width;
  final bool? isExpanded;
  final bool? colorFill;
  final bool? isRounded;

  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.title,
    this.isExpanded,
    this.icon,
    this.iconSize,
    this.width,
    this.colorFill,
    this.isRounded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: isRounded == false
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
          : StadiumBorder(
              side: BorderSide(
                color: colorFill == false ? Palette.primaryColor : Palette.onPrimaryColor,
                width: 1,
              ),
            ),
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      height: 50,
      color: colorFill == false ? null : Palette.primaryColor,
      textColor: colorFill == false ? Palette.primaryColor : Palette.onPrimaryColor,
      disabledColor: Palette.disabledColor,
      disabledTextColor: Palette.onDisabledColor,
      minWidth: isExpanded == true ? double.maxFinite : width,
      highlightElevation: 0,
      disabledElevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextView(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            textType: TextType.primaryButton,
            color: colorFill == false
                ? Palette.primaryColor
                : onPressed == null
                    ? Palette.onDisabledColor
                    : Palette.onPrimaryColor,
          ),
          if (icon != null) const SizedBox.square(dimension: 10),
          if (icon != null)
            SizedBox.square(
              dimension: iconSize ?? 10,
              child: SvgPicture.asset(icon ?? ''),
            ),
        ],
      ),
    );
  }
}

class PrimaryIconButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final String svg;
  final double? size;
  final EdgeInsets? padding;
  final Color? color;

  const PrimaryIconButton({
    Key? key,
    this.onPressed,
    required this.svg,
    this.padding,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: padding ?? EdgeInsets.zero,
      onPressed: onPressed,
      child: SizedBox.square(
        dimension: size ?? 24,
        child: SvgPicture.asset(
          svg,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class PrimaryTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool? isUpperCase, showUnderline;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final EdgeInsets? padding;

  const PrimaryTextButton({
    Key? key,
    this.onPressed,
    required this.title,
    this.isUpperCase,
    this.showUnderline,
    this.color,
    this.size,
    this.weight,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: padding ?? EdgeInsets.zero,
      minSize: 0,
      child: TextView(
        isUpperCase == false ? title : title.toUpperCase(),
        color: color ?? const Color(0xff193b61),
        size: size,
        decoration: showUnderline == true ? TextDecoration.underline : null,
        textType: TextType.primaryTextButton,
        fontWeight: weight,
      ),
    );
  }
}
