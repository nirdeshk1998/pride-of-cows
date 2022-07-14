import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/screens/cart/cart_screen.dart';
import 'package:poc/screens/cart/offers.dart';
import 'package:poc/screens/cart/rating_page.dart';
import 'package:poc/screens/menu/menu_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/widgets/buttons.dart';
class MyProfile extends ConsumerWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool addressSelect = true;
    //   var genderList = [
    // "Male","Female","Others"
    //   ];
    List<DropdownMenuItem> genderList = [
      DropdownMenuItem(
        child: Text("Male"),
        value: "Male",
      ),
      DropdownMenuItem(
        child: Text("Female"),
        value: "Female",
      ),
      DropdownMenuItem(
        child: Text("Others"),
        value: "Others",
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MenuScreen()));
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black54,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text("My Profile", style: TextStyles.header),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "First Name*",
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: "Enter Here",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Last Name*",
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: "Enter Here",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child:    TextFormField(
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: DropdownButtonFormField(
                        hint: Text("Gender*"),
                        onChanged: (value) {},
                        items: genderList,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email Id*",
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: "Enter Here",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
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
      ),
    );
  }
}
