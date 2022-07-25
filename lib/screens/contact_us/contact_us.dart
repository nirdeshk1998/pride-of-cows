import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/faq_&_links/order_help.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/text_view.dart';
import 'package:country_code_picker/country_code_picker.dart';
class ContactUs extends ConsumerWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SecondaryAppBar(),
            10.0.height,
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPadding),
              child: TextView(
                'Contact Us',
                textType: TextType.header,
              ),
            ),
            10.0.height,
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextView(
                        "Reach us",
                        size: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.4,
                        child: Divider(
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(Assets.assetsIconsWhatsappIconGrey),
                      SizedBox(
                        width: 10,
                      ),
                      TextView("+91-9876543210", size: 16,
                        fontWeight: FontWeight.w400,),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.assetsIconsPhoneGrey),
                      SizedBox(
                        width: 10,
                      ),
                      TextView("022 - 68156815", size: 16,
                        fontWeight: FontWeight.w400,),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Flexible(
                        child: TextView(
                          "Mon - Sat: 7:30am - 7:30pm; Sun: 7.30am – 3.30pm",
                          size: 16, color: Palette.hintColor, maxLines: 2,),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.assetsIconsEmail),
                      SizedBox(
                        width: 10,
                      ),
                      TextView("bookings@prideofcows.com", size: 16,
                        fontWeight: FontWeight.w400,),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(Assets.assetsIconsLocationGrey),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(child: TextView(
                        "Pride of Cows, 20th flr, Nirmal Building, Nariman Pt, Mumbai, Maharashtra-400021",
                        size: 16, fontWeight: FontWeight.w400, maxLines: 2,),),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextView(
                        "Submit your Query",
                        size: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2,
                        child: Divider(
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const PrimaryTextFormField(
                    label: 'Full Name*',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                          maxHeight: 50, minWidth: 50),
                      labelText: 'Phone number*',
                      prefixIcon: Padding(
                        padding:
                        const EdgeInsets.only(left: 15, right: 5),
                        child: CountryCodePicker(
                          initialSelection: 'in',
                          textStyle: TextStyle(
                            color: Palette.textColor,
                            fontFamily: GoogleFonts
                                .lato()
                                .fontFamily,
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                          ),
                          flagWidth: 20,
                          showDropDownButton: true,
                          flagDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(),
                      labelStyle: TextStyle(
                        color: Palette.hintColor,
                        fontFamily: GoogleFonts
                            .lato()
                            .fontFamily,
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: Palette.hintColor,
                        fontFamily: GoogleFonts
                            .lato()
                            .fontFamily,
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
                  SizedBox(
                    height: 20,
                  ),
                  const PrimaryTextFormField(
                    label: 'Your Location*',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Your Message"
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        title: "Submit", onPressed: () {}, colorFill: true,)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
