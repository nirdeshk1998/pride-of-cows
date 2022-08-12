import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/authentication/providers/register_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/primary_dropdown_form_field.dart';
import 'package:poc/widgets/terms_condition.dart';
import 'package:poc/widgets/text_view.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rProvider = ref.read(registerProvider);
    final wProvider = ref.watch(registerProvider);

    return Scaffold(
      body: Stack(
        children: [
          _buildBody(wProvider, rProvider, context),
          if (rProvider.isLoading) const PrimaryLoader(),
        ],
      ),
    );
  }

  SafeArea _buildBody(
    RegisterChangeProvider rProvider,
    RegisterChangeProvider wProvider,
    BuildContext context,
  ) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                Assets.assetsLogoPocLogo,
                height: 60,
                fit: BoxFit.fitHeight,
              ),
            ),
            30.0.height,
            TextView(
              'Register',
              textType: TextType.header,
            ),
            5.0.height,
            TextView(
              'Please create an account to continue.',
              textType: TextType.hint,
              color: Palette.hintColor,
            ),
            10.0.height,
            const Divider(thickness: 1, height: 1, color: Palette.surfaceColor),
            40.0.height,
            PrimaryTextFormField(
              label: 'First Name*',
              controller: rProvider.firstNameController,
            ),
            26.0.height,
            PrimaryTextFormField(
              label: 'Last Name*',
              controller: rProvider.lastNameController,
            ),
            26.0.height,
            PrimaryTextFormField(
              label: 'Email ID*',
              controller: rProvider.emailController,
            ),
            26.0.height,
            PrimaryDropdownFormField(
              label: 'Gender*',
              list: const ['Male', 'Female', 'Other'],
              onChanged: rProvider.onGenderChanged,
            ),
            26.0.height,
            PrimaryTextFormField(
              label: 'Have a referral code? Enter it here',
              controller: rProvider.referralController,
            ),
            26.0.height,
            PrimaryTextFormField(
              label: 'Address line 1*',
              controller: rProvider.addressLineController,
            ),
            26.0.height,
            PrimaryTextFormField(
              label: 'Address line 2 (optional)',
              controller: rProvider.addressLine2Controller,
            ),
            26.0.height,
            PrimaryTextFormField(
              label: 'Pincode*',
              controller: rProvider.pincodeController,
            ),
            26.0.height,
            PrimaryDropdownFormField(
              label: 'State*',
              list: wProvider.stateList,
              onChanged: rProvider.onStateChanged,
            ),
            26.0.height,
            PrimaryDropdownFormField(
              label: 'City*',
              list: wProvider.cityList,
              onChanged: rProvider.onCityChanged,
            ),
            30.0.height,
            Center(
              child: PrimaryButton(
                title: 'start shopping',
                onPressed: () => rProvider.onStartShoppingButton(context),
              ),
            ),
            15.0.height,
            TermsConditionsWidget(
              checkState: wProvider.tcToggle,
              onCheckPressed: rProvider.onTcPressedFun,
            ),
            Dimensions.defaultPadding.height,
          ],
        ),
      ),
    );
  }
}
