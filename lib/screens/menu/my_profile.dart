import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/cart/cart_screen.dart';
import 'package:poc/screens/cart/offers.dart';
import 'package:poc/screens/cart/rating_page.dart';
import 'package:poc/screens/menu/menu_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';

class MyProfile extends ConsumerWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool addressSelect = true;
    //   var genderList = [
    // "Male","Female","Others"
    //   ];
    List<DropdownMenuItem> genderList = [
      const DropdownMenuItem(
        child: const Text("Male"),
        value: "Male",
      ),
      const DropdownMenuItem(
        child: Text("Female"),
        value: "Female",
      ),
      const DropdownMenuItem(
        child: const Text("Others"),
        value: "Others",
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SecondaryAppBar(showRightButton: false),
            const SizedBox(height: Dimensions.defaultPadding),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const PrimaryTextFormField(
                    label: 'First Name*',
                  ),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "First Name*",
                        labelStyle: const TextStyle(fontSize: 20),
                        hintText: "Enter Here",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Last Name*",
                      labelStyle: const TextStyle(fontSize: 20),
                      hintText: "Enter Here",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
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
                  // Container(
                  //   child: DropdownButtonFormField(
                  //     hint: Text("Gender*"),
                  //     onChanged: (value) {},
                  //     items: genderList,
                  //     decoration: const InputDecoration(
                  //       enabledBorder: OutlineInputBorder(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(40)),
                  //           borderSide:
                  //               BorderSide(color: Colors.grey, width: 1)),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(40)),
                  //           borderSide:
                  //               BorderSide(color: Colors.grey, width: 1)),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email Id*",
                        labelStyle: const TextStyle(fontSize: 20),
                        hintText: "Enter Here",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
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
