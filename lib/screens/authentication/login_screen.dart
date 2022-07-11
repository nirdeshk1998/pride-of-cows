import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/providers/login_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/utils/country_code_picker.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/terms_condition.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rProvider = ref.read(loginProvider);
    final wProvider = ref.watch(loginProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  Assets.assetsLogoPocLogo,
                  height: 60,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox.square(dimension: 30),
              SizedBox(height: 38, child: Text('Welcome!', textAlign: TextAlign.left, style: TextStyles.header)),
              const SizedBox.square(dimension: 5),
              Text(
                'Welcome to the Pride of Cows Family.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color.fromRGBO(127, 127, 127, 1),
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
              const SizedBox.square(dimension: 10),
              const Divider(thickness: 1, height: 1, color: Palette.surfaceColor),
              const SizedBox.square(dimension: 40),
              TextFormField(
                controller: wProvider.numberController,
                onChanged: rProvider.onChangedFun,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  constraints: const BoxConstraints(maxHeight: 50, minWidth: 50),
                  labelText: 'Phone number*',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 5),
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
                      showDropDownButton: true,
                      flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
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
              ),
              const SizedBox.square(dimension: 30),
              Text(
                'Enter OTP sent to your phone number*',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color.fromRGBO(127, 127, 127, 1),
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
              const SizedBox.square(dimension: 5),
              PinCodeTextField(
                appContext: context,
                length: 4,
                textStyle: TextStyle(
                  color: const Color.fromRGBO(43, 43, 43, 1),
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                ),
                pinTheme: PinTheme(
                  fieldHeight: 30,
                  fieldOuterPadding: EdgeInsets.zero,
                  borderWidth: 1,
                  inactiveColor: Palette.surfaceColor,
                  activeColor: Palette.primaryColor,
                  fieldWidth: 62,
                ),
                onChanged: (i) {},
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Resend OTP via ',
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
                      text: 'sms',
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
                    TextSpan(
                      text: ' or ',
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
                      text: 'call.',
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
              const SizedBox.square(dimension: 30),
              Center(
                child: PrimaryButton(
                  title: 'send otp',
                  onPressed: wProvider.otpButtonState ? () => rProvider.onSendOtpButton(context) : null,
                ),
              ),
              const SizedBox.square(dimension: 15),
              TermsConditionsWidget(
                checkState: wProvider.checkState,
                onCheckPressed: rProvider.onCheckFun,
              )
            ],
          ),
        ),
      ),
    );
  }
}