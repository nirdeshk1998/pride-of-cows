import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/providers/login_provider.dart';
import 'package:poc/screens/cart/cart_screen.dart';
import 'package:poc/screens/cart/offers.dart';
import 'package:poc/screens/cart/rating_page.dart';
import 'package:poc/screens/menu/address/edit_address.dart';
import 'package:poc/screens/menu/menu_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/primary_dropdown_form_field.dart';
import 'package:poc/widgets/terms_condition.dart';
import 'package:poc/widgets/text_view.dart';

class AddressInfromation extends ConsumerWidget {
  const AddressInfromation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SecondaryAppBar(showRightButton: false),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Home', style: TextStyles.header),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const TextView(
                    "Address Infromation",
                    color: Palette.hintColor,
                    size: 16,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>EditAddress()));
                    },
                    title: "Edit Address",
                    showUnderline: true,
                    size: 16,
                    isUpperCase: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  const TextView(
                    "Delivery Instruction",
                    color: Palette.hintColor,
                    size: 16,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Radio(
                          value: true, groupValue: true, onChanged: (value) {}),
                      TextView("Contactless delivery at the door"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: false,
                          groupValue: true,
                          onChanged: (value) {}),
                      TextView("Hand me the order"),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50),
                    child: TextView(
                      "Order will be directly given to you",
                      color: Palette.hintColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Radio(
                          value: false,
                          groupValue: true,
                          onChanged: (value) {}),
                      TextView("Contactless delivery to the guard"),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  const TextView(
                    "Additional instructions",
                    color: Palette.hintColor,
                    size: 16,
                  ),
                  Row(
                    children: [
                      Radio(
                          value: true, groupValue: true, onChanged: (value) {}),
                      TextView("Ring the bell"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: false,
                          groupValue: true,
                          onChanged: (value) {}),
                      TextView("Don't Ring the bell"),
                    ],
                  ),
                  Row(
                    children: [
                      TextView("Special Instruction:",size: 16,),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Write here"
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(title: "SAVE"),
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

