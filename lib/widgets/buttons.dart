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
  final double? iconSize, width, height;
  final bool? isExpanded;
  final bool? isFilled;
  final bool? isRounded;
  final EdgeInsets? padding;
  final Color strokeColor, color;

  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.title,
    this.isExpanded,
    this.icon,
    this.iconSize,
    this.width,
    this.isFilled,
    this.isRounded,
    this.padding,
    this.height,
    this.strokeColor = Palette.primaryColor,
    this.color = Palette.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: isRounded == false
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
          : StadiumBorder(
              side: BorderSide(
                color: isFilled == false ? strokeColor : Palette.onPrimaryColor,
                width: isFilled == false ? 1 : 0,
              ),
            ),
      elevation: 0,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 40),
      height: height ?? 50,
      color: isFilled == false ? null : color,
      textColor: isFilled == false ? Palette.primaryColor : Palette.onPrimaryColor,
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
            height: 1.1,
            letterSpacing: 1.2,
            textType: TextType.primaryButton,
            color: isFilled == false
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
          color: color,
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
  final double? size, height, letterSpacing;
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
    this.height,
    this.letterSpacing,
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
        letterSpacing: letterSpacing,
        height: height,
        decoration: showUnderline == true ? TextDecoration.underline : null,
        textType: TextType.primaryTextButton,
        fontWeight: weight,
      ),
    );
  }
}

class ToogleButton extends StatefulWidget {
  final double width;
  final double height;

  final String leftDescription;
  final String rightDescription;

  final Color toggleColor;
  final Color toggleBackgroundColor;
  final Color toggleBorderColor;

  final double _leftToggleAlign = -1;
  final double _rightToggleAlign = 1;

  final VoidCallback onLeftToggleActive;
  final VoidCallback onRightToggleActive;

  const ToogleButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.toggleBackgroundColor,
      required this.toggleBorderColor,
      required this.toggleColor,
      required this.leftDescription,
      required this.rightDescription,
      required this.onLeftToggleActive,
      required this.onRightToggleActive})
      : super(key: key);

  @override
  _ToogleButtonState createState() => _ToogleButtonState();
}

class _ToogleButtonState extends State<ToogleButton> {
  double _toggleXAlign = -1;

  late Color _leftDescriptionColor;
  late Color _rightDescriptionColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: widget.toggleBorderColor),
        color: widget.toggleBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(_toggleXAlign, 0),
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: widget.width * 0.5,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.toggleColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  _toggleXAlign = widget._leftToggleAlign;
                },
              );
              widget.onRightToggleActive();
            },
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: widget.width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.leftDescription,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xff193B61)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  _toggleXAlign = widget._rightToggleAlign;
                },
              );

              widget.onLeftToggleActive();
            },
            child: Align(
              alignment: const Alignment(1, 0),
              child: Container(
                width: widget.width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.rightDescription,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xff193B61)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
