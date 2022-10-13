import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/contact_us/providers/contact_us_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/text_view.dart';
import 'package:country_code_picker/country_code_picker.dart';

class ContactUs extends ConsumerWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch=ref.watch(contactUsProvider);
    final read=ref.read(contactUsProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SecondaryAppBar(),
            10.0.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
              child: TextView(
                'Contact Us',
                textType: TextType.header,
              ),
            ),
            10.0.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      const TextView(
                        "Reach us",
                        size: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.42,
                        child: const Divider(
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(Assets.assetsIconsWhatsappGrey),
                      const SizedBox(
                        width: 10,
                      ),
                      const TextView(
                        "+91-9876543210",
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.assetsIconsPhoneGrey, height: 20.62, width: 20.62),
                      const SizedBox(
                        width: 10,
                      ),
                      const TextView(
                        "022 - 68156815",
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 28,
                      ),
                      Flexible(
                        child: TextView(
                          "Mon - Sat: 7:30am - 7:30pm; Sun: 7.30am – 3.30pm",
                          size: 16,
                          color: Palette.hintColor,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.assetsIconsEmail,
                        height: 20.62,
                        width: 20.62,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const TextView(
                        "bookings@prideofcows.com",
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(Assets.assetsIconsLocationGrey, height: 20.62, width: 20.62),
                      const SizedBox(
                        width: 10,
                      ),
                      const Flexible(
                        child: TextView(
                          "Pride of Cows, 20th flr, Nirmal Building, Nariman Pt, Mumbai, Maharashtra-400021",
                          size: 16,
                          fontWeight: FontWeight.w400,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const TextView(
                        "Submit your Query",
                        size: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: const Divider(
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   PrimaryTextFormField(
                    controller: watch.nameController,
                    label: 'Full Name*',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: watch.phoneNoController,
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
                  const SizedBox(
                    height: 20,
                  ),
                   PrimaryTextFormField(
                  controller: watch.emailIdController,
                    label: 'Email Id*',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   PrimaryTextFormField(
                     controller: watch.locationController,
                    label: 'Your Location*',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: watch.messageController,
                    decoration: const InputDecoration(labelText: "Your Message"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        title: "Submit",
                        onPressed: () {
                          read.onSubmitQuery(context);
                        },
                        isFilled: true,
                      )
                    ],
                  ),
                  const SizedBox(
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
