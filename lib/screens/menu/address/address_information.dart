import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/menu/address/edit_address.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class AddressInfromation extends ConsumerWidget {
  const AddressInfromation({Key? key}) : super(key: key);

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
                      Text('Home', style: TextStyles.header),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextView(
                    "Address Infromation",
                    color: Palette.hintColor,
                    size: 16,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PrimaryTextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAddress()));
                    },
                    title: "Edit Address",
                    showUnderline: true,
                    size: 16,
                    isUpperCase: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const TextView(
                    "Delivery Instruction",
                    color: Palette.hintColor,
                    size: 16,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Radio(value: true, groupValue: true, onChanged: (value) {}),
                      const TextView("Contactless delivery at the door"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: false, groupValue: true, onChanged: (value) {}),
                      const TextView("Hand me the order"),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 50),
                    child: const TextView(
                      "Order will be directly given to you",
                      color: Palette.hintColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Radio(value: false, groupValue: true, onChanged: (value) {}),
                      const TextView("Contactless delivery to the guard"),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const TextView(
                    "Additional instructions",
                    color: Palette.hintColor,
                    size: 16,
                  ),
                  Row(
                    children: [
                      Radio(value: true, groupValue: true, onChanged: (value) {}),
                      const TextView("Ring the bell"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: false, groupValue: true, onChanged: (value) {}),
                      const TextView("Don't Ring the bell"),
                    ],
                  ),
                  Row(
                    children: [
                      const TextView(
                        "Special Instruction:",
                        size: 16,
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Write here"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const PrimaryButton(title: "SAVE"),
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
