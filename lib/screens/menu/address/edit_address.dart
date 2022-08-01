import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/text_view.dart';

class EditAddress extends ConsumerWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SecondaryAppBar(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Edit Address', style: TextStyles.header),
                    ],
                  ),
                  Text("Home", style: TextStyles.subheader),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                              child: const Image(
                            image: const AssetImage("assets/images/maps.png"),
                          )),
                          Positioned(
                            bottom: 100,
                            left: 210,
                            child: SvgPicture.asset(Assets.assetsIconsPin2),
                          ),
                          Positioned(
                            bottom: 125,
                            left: 170,
                            child: SvgPicture.asset(Assets.assetsIconsDeliverHere),
                          ),
                          Positioned(
                            bottom: 119,
                            left: 210,
                            child: SvgPicture.asset(Assets.assetsIconsArrowDownSolid),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PrimaryTextFormField(
                          label: 'Full name (first name and last name)*',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
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
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            constraints: const BoxConstraints(maxHeight: 50, minWidth: 50),
                            labelText: 'Alternate phone number',
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
                        const PrimaryTextFormField(
                          label: 'Pin Code',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const PrimaryTextFormField(
                          label: 'Address*',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const PrimaryTextFormField(
                          label: 'Landmark',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const PrimaryTextFormField(
                          label: 'City',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const PrimaryTextFormField(
                          label: 'State',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextView(
                          "Save Address as",
                          color: Palette.hintColor,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Radio(value: false, groupValue: true, onChanged: (value) {}),
                                  const Text("Home"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Radio(value: false, groupValue: true, onChanged: (value) {}),
                                  const Text("Work"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Radio(value: true, groupValue: true, onChanged: (value) {}),
                                  const Text("Other"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: const InputDecoration(hintText: "Address"),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                              activeColor: Colors.white,
                              checkColor: Colors.black,
                            ),
                            const TextView(
                              "Use as my default",
                              color: Palette.hintColor,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(
                              title: "SAVE & REQUEST CHANGE",
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext index) {
                                      // return AlertDialog(
                                      //   title: Text("Request for updating address sent!",style: TextStyles.header,),
                                      // );
                                      return Dialog(
                                        child: Container(
                                          height: 300,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Request for updating \n       address sent!",
                                                style: TextStyles.header,
                                              ),
                                              Divider(
                                                thickness: 1,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 18, right: 18),
                                                child: Text(
                                                  "We will review your request and update the address after verification.The verification process will take upto 24 hours.",
                                                  style: TextStyle(fontSize: 17),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  PrimaryButton(
                                                    title: "OKAY, I UNDERSTAND",
                                                    isFilled: true,
                                                    onPressed: () {},
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Pride of Cows team will review your request to change this address and implement it at the earliest.",
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(
                              title: "DISCARD CHANGES",
                              onPressed: () {},
                              isFilled: false,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
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
