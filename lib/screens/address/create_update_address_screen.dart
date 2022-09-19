import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/address/data/models/addressbook_model.dart';
import 'package:poc/screens/address/provider/create_update_address_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/checkbox.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/image_view.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/primary_dropdown_form_field.dart';
import 'package:poc/widgets/text_view.dart';

class CreateUpdateAddressScreen extends ConsumerWidget {
  const CreateUpdateAddressScreen({
    Key? key,
    required this.addressType,
    this.addressData,
  }) : super(key: key);

  final AddressType addressType;
  final AddressBookData? addressData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(createUpdateAddressProvider);
    final watch = ref.watch(createUpdateAddressProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => read.initState(
        context,
        addressType == AddressType.edit ? addressData : null,
      ),
    );

    return Scaffold(
      body: StackedLoader(
        isLoading: watch.isLoading,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SecondaryAppBar(),
            Padding(
              padding: const EdgeInsets.all(Dimensions.defaultPadding),
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
                  10.0.height,
                  const ImageView(
                    Assets.assetsImagesMaps,
                    height: 170,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryTextFormField(
                        label: 'Full name (first name and last name)*',
                        controller: read.fullNameController,
                      ),
                      20.0.height,
                      PhoneNumberFormField(
                        label: 'Phone Number',
                        controller: read.phoneNumberController,
                      ),
                      20.0.height,
                      PhoneNumberFormField(
                        label: 'Alternate phone number',
                        controller: read.altNumberController,
                      ),
                      20.0.height,
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
                      20.0.height,
                      PrimaryTextFormField(
                        label: 'Locality*',
                        controller: read.localityController,
                      ),
                      20.0.height,
                      PrimaryTextFormField(
                        label: 'Landmark',
                        controller: read.landmarkController,
                      ),
                      20.0.height,
                      PrimaryTextFormField(
                        label: 'Pincode*',
                        isNumber: true,
                        maxLength: 6,
                        onChanged: (i) => read.onPincodeChanged(i),
                        controller: read.pincodeController,
                      ),
                      20.0.height,
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
                      20.0.height,
                      TextView(
                        "Save Address as",
                        textType: TextType.subtitle,
                        color: Palette.hintColor,
                      ),
                      RadioTheme(
                        data: const RadioThemeData(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                        ),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: Radio<AddressGroupValue>(
                                value: AddressGroupValue.home,
                                groupValue: watch.groupValue,
                                onChanged: read.onGroupValueChanged,
                              ),
                            ),
                            const TextView(
                              "Home",
                              size: TextSize.regularLarge,
                            ),
                            Dimensions.defaultPadding.width,
                            Transform.scale(
                              scale: 0.8,
                              child: Radio<AddressGroupValue>(
                                value: AddressGroupValue.work,
                                groupValue: watch.groupValue,
                                onChanged: read.onGroupValueChanged,
                              ),
                            ),
                            const TextView(
                              "Work",
                              size: TextSize.regularLarge,
                            ),
                            Dimensions.defaultPadding.width,
                            Transform.scale(
                              scale: 0.8,
                              child: Radio<AddressGroupValue>(
                                value: AddressGroupValue.other,
                                groupValue: watch.groupValue,
                                onChanged: read.onGroupValueChanged,
                              ),
                            ),
                            const TextView(
                              "Other",
                              size: TextSize.regularLarge,
                            ),
                          ],
                        ),
                      ),
                      if (watch.groupValue == AddressGroupValue.other) 10.0.height,
                      if (watch.groupValue == AddressGroupValue.other)
                        SecondaryFormField(
                          hint: 'e.g. Mom\'s house',
                          controller: read.otherAddressController,
                          isDense: true,
                          contentPadding: const EdgeInsets.only(bottom: 6.0),
                          constraints: const BoxConstraints(maxHeight: 50, minHeight: 0),
                        ),
                      10.0.height,
                      Row(
                        children: [
                          PrimaryCheckbox(
                            value: watch.isDefaultAddress,
                            onChanged: read.onDefaultAddressChanged,
                          ),
                          5.0.width,
                          const TextView(
                            'Use as my default address',
                            color: Palette.lightTextColor,
                            height: 1,
                          ),
                        ],
                      ),
                      30.0.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryButton(
                            title: 'SAVE & REQUEST CHANGE',
                            onPressed: read.onSaveButton,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextView(
                        "Pride of Cows team will review your request to change this address and implement it at the earliest.",
                        maxLines: 3,
                        height: 1.5,
                      ),
                      30.0.height,

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
                      30.0.height,
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
