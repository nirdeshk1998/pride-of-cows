import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/widgets/buttons.dart';

class TermsConditionsWidget extends StatelessWidget {
  final bool checkState;
  final VoidCallback onCheckPressed;

  const TermsConditionsWidget({
    Key? key,
    required this.checkState,
    required this.onCheckPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryIconButton(
          height: 20,
          width: 20,
          padding: const EdgeInsets.symmetric(vertical: 2),
          svg: checkState ? Assets.assetsIconsCheckboxChecked : Assets.assetsIconsCheckboxUnchecked,
          onPressed: onCheckPressed,
        ),
        const SizedBox.square(dimension: 5),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'By signing in you agree to our ',
                  style: TextStyle(
                    color: const Color(0xFF9B9B9B),
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: 'terms and conditions',
                  style: TextStyle(
                    color: const Color(0xFF193B61),
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
