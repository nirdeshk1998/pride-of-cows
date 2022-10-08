import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/profile/providers/my_profile_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/checkbox.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/primary_dropdown_form_field.dart';
import 'package:poc/widgets/text_view.dart';

class MyProfile extends ConsumerStatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  ConsumerState<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends ConsumerState<MyProfile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(profileProvider).initState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final rProvider = ref.read(profileProvider);
    final wProvider = ref.watch(profileProvider);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SecondaryAppBar(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(children: [
                    Row(
                      children: [
                        Text('My Profile', style: TextStyles.header),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryTextFormField(
                      label: 'First Name*',
                      hint: 'Enter Here',
                      controller: wProvider.fNameController,
                      onChanged: rProvider.onChangeFNameFun,
                    ),
                    const SizedBox(height: 20),
                    PrimaryTextFormField(
                      label: 'Last Name*',
                      hint: 'Enter Here',
                      controller: wProvider.lNameController,
                      onChanged: rProvider.onChangeLNameFun,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: wProvider.phoneNoController,
                      onChanged: rProvider.onChangePhNoFun,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        constraints:
                        const BoxConstraints(maxHeight: 50, minWidth: 50),
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
                            flagDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4)),
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
                    PrimaryDropdownFormField(
                      value:wProvider.gender,
                      onChanged: rProvider.onChangeGenderFun,
                      list: const ["Male", "Female","Others"],
                      label: 'Gender*',

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryTextFormField(
                      controller: wProvider.eMailController,
                      onChanged: rProvider.onChangeEmailFun,
                      label: 'Email Id*',
                      hint: 'Enter Here',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      onTap: () async{
                        wProvider.pickedDate= await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1901, 1),
                          lastDate: DateTime(2100),
                        );
                        rProvider.onDateSelected(wProvider.pickedDate);
                      },
                      controller: wProvider.dobController,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        constraints:
                        const BoxConstraints(maxHeight: 50, minWidth: 50),
                        hintText: 'Date of birth',
                        prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 5),
                            child: SizedBox(
                              width: 50,
                              child: Row(
                                children: [
                                  SvgPicture.asset(Assets.assetsIconsCalender2),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            )),
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
                      height: 10,
                    ),
                    Row(
                      children: [
                        PrimaryCheckbox(onChanged:rProvider.onSubScribeChecked),
                        const SizedBox(
                          width: 5,
                        ),
                        const TextView(
                          "Email me with news and offers",
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    30.0.height,
                    wProvider.saveButtonState
                        ? PrimaryButton(
                      title: "Edit",
                      onPressed:(){
                        rProvider.onEditButtonPressed(context);
                      },
                      isFilled: false,
                    )
                        : const PrimaryButton(
                      title: "SAVE",
                    ),
                  ]),
                ),
              ],
            ),
          ),
          if (rProvider.isLoading) const PrimaryLoader(),
        ],
      ),

    );
  }
}
