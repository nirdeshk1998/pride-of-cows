import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/widgets/text_view.dart';

class PrimaryTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool? isNumber;
  final int? maxLength;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const PrimaryTextFormField({
    Key? key,
    this.label,
    this.controller,
    this.hint,
    this.onChanged,
    this.isNumber,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: isNumber == true ? TextInputType.number : null,
      inputFormatters: [
        if (isNumber == true) FilteringTextInputFormatter.digitsOnly,
        if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        constraints: const BoxConstraints(maxHeight: 50, minHeight: 50),
        labelText: '$label',
        hintText: hint != null ? '$hint' : "",
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

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.suffix,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.search,
      style: TextType.hint.apply(color: Palette.textColor, heightFactor: 1.2),
      decoration: InputDecoration(
        suffix: suffix,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: SizedBox.square(
            dimension: 18,
            child: SvgPicture.asset(
              Assets.assetsIconsSearch,
              color: Palette.hintColor,
            ),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        hintText: hintText,
        hintStyle: TextType.hint.apply(color: Palette.hintColor),
        contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        constraints: const BoxConstraints(minHeight: 50, maxHeight: 50),
        fillColor: Colors.white,
        filled: true,
        border: WidgetStyle.inputBorder,
        enabledBorder: WidgetStyle.inputBorder,
        focusedBorder: WidgetStyle.activeInputBorder,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(100),
        //   borderSide: BorderSide.none,
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(100),
        //   borderSide: const BorderSide(color: Palette.outlineColor),
        // ),
      ),
    );
  }
}

class PhoneNumberFormField extends StatelessWidget {
  const PhoneNumberFormField({
    super.key,
    this.label,
    this.controller,
    this.onChanged,
    this.enabled,
  });

  final String? label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      enabled: enabled,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        constraints: const BoxConstraints(maxHeight: 50, minHeight: 50),
        labelText: label ?? 'Phone number*',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15, right: 5),
          child: Container(
            decoration: BoxDecoration(
              // color: Palette.backgroundColor,
              borderRadius: Dimensions.maxRadius,
            ),
            child: CountryCodePicker(
              initialSelection: 'in',
              textStyle: TextStyle(
                color: Palette.textColor,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontSize: 16,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
              ),
              flagWidth: 20,
              padding: EdgeInsets.zero,
              showDropDownButton: true,
              flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            ),
          ),
        ),
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

class SecondaryFormField extends StatelessWidget {
  const SecondaryFormField({
    Key? key,
    this.hint,
    this.controller,
    this.onChanged,
    this.constraints,
    this.contentPadding,
    this.isDense,
  }) : super(key: key);

  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final BoxConstraints? constraints;
  final EdgeInsets? contentPadding;
  final bool? isDense;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      textCapitalization: TextCapitalization.sentences,
      style: TextType.hint.apply(color: Palette.textColor),
      decoration: InputDecoration(
        isDense: isDense ?? false,
        hintText: hint ?? 'Type your message here...',
        hintStyle: TextType.hint.apply(color: Palette.hintColor),
        border: const UnderlineInputBorder(borderSide: BorderSide(color: Palette.surfaceColor, width: 1)),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Palette.surfaceColor, width: 1)),
        contentPadding: contentPadding ?? EdgeInsets.zero,
        constraints: constraints ?? const BoxConstraints(maxHeight: 50, minHeight: 50),
      ),
    );
  }
}
