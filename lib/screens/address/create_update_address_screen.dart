import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/address/my_address_book_screen.dart';
import 'package:poc/screens/address/provider/create_update_address_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/image_view.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/primary_dropdown_form_field.dart';
import 'package:poc/widgets/text_view.dart';

class CreateUpdateAddressScreen extends ConsumerWidget {
  const CreateUpdateAddressScreen({Key? key, required this.addressType}) : super(key: key);

  final AddressType addressType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(createUpdateAddressProvider);
    final watch = ref.watch(createUpdateAddressProvider);

    read.initState(context);
    return Scaffold(
      body: StackedLoader(
        isLoading: watch.isLoading,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SecondaryAppBar(),
            Dimensions.defaultPadding.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextView(
                        addressType == AddressType.add ? 'Add Address' : 'Edit Address',
                        textType: TextType.header,
                        height: 1,
                      ),
                    ],
                  ),
                  10.0.height,
                  TextView(
                    "Home",
                    textType: TextType.titleStyled,
                    height: 1,
                  ),
                  const ImageView(
                    Assets.assetsImagesMaps,
                    height: 170,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryTextFormField(
                        label: 'Full name (first name and last name)*',
                        controller: read.fullNameController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PhoneNumberFormField(
                        label: 'Phone Number',
                        controller: read.phoneNumberController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PhoneNumberFormField(
                        label: 'Alternate phone number',
                        controller: read.altNumberController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // PrimaryTextFormField(
                      //   label: 'Pincode*',
                      //   controller: read.pincodeController,
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      PrimaryTextFormField(
                        label: 'Address*',
                        controller: read.addressController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryTextFormField(
                        label: 'Locality*',
                        controller: read.localityController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryTextFormField(
                        label: 'Landmark',
                        controller: read.landmarkController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryTextFormField(
                        label: 'Pincode*',
                        isNumber: true,
                        maxLength: 6,
                        onChanged: (i) => read.onPincodeChanged(i),
                        controller: read.pincodeController,
                      ),
                      26.0.height,
                      PrimaryDropdownFormField(
                        label: 'State*',
                        value: watch.stateDropdownValue,
                        items: watch.stateList
                            .map(
                              (e) => DropdownMenuItem(
                                value: e.stateId,
                                child: Text(e.stateName ?? ''),
                              ),
                            )
                            .toList(),
                        onChanged: (i) => read.onStateChanged(i),
                      ),
                      26.0.height,
                      PrimaryDropdownFormField(
                        label: 'City*',
                        value: watch.cityDropdownValue,
                        items: watch.cityList
                            .map(
                              (e) => DropdownMenuItem(
                                value: e.cityId,
                                child: Text(e.cityName ?? ''),
                              ),
                            )
                            .toList(),
                        onChanged: (i) => read.onCityChanged(i),
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
                          Row(
                            children: [
                              Radio(
                                value: watch.home,
                                groupValue: true,
                                onChanged: read.onChangeHomeFun,
                              ),
                              const Text("Home"),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Radio(
                                value: watch.work,
                                groupValue: true,
                                onChanged: read.onChangeWorkFun,
                              ),
                              const Text("Work"),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Radio(
                                  value: watch.others,
                                  groupValue: true,
                                  onChanged: read.onChangeOthersFun,
                                ),
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
                            value: watch.defaultAddress,
                            onChanged: read.onChangeDefaultAddressFun,
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
                                    return AlertDialog(
                                      title: Text(
                                        "Request for updating address sent!",
                                        style: TextStyle(fontFamily: GoogleFonts.suranna().fontFamily, fontSize: 24, fontWeight: FontWeight.w400, height: 1),
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Divider(
                                              thickness: 1,
                                            ),
                                            Container(
                                              child: const TextView(
                                                "We will review your request and update the address after verification.The verification process will take upto 24 hours.",
                                                size: 16,
                                                maxLines: 10,
                                                height: 1.4,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                PrimaryButton(
                                                  title: "OKAY, I UNDERSTAND",
                                                  isFilled: true,
                                                  onPressed: () {
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyAddressBook()));
                                                  },
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 30,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
