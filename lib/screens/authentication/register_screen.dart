import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/providers/register_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/primary_dropdown_form_field.dart';
import 'package:poc/widgets/terms_condition.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rProvider = ref.read(registerProvider);
    final wProvider = ref.watch(registerProvider);

    return Scaffold(
      body: SafeArea(
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
              const SizedBox.square(dimension: 30),
              SizedBox(
                height: 38,
                child: Text('Register', textAlign: TextAlign.left, style: TextStyles.header),
              ),
              const SizedBox.square(dimension: 5),
              Text(
                'Please create an account to continue.',
                textAlign: TextAlign.left,
                style: TextStyles.hint,
              ),
              const SizedBox.square(dimension: 10),
              const Divider(thickness: 1, height: 1, color: Palette.surfaceColor),
              const SizedBox.square(dimension: 40),
              const PrimaryTextFormField(
                label: 'First Name*',
              ),
              const SizedBox.square(dimension: 26),
              const PrimaryTextFormField(
                label: 'Last Name*',
              ),
              const SizedBox.square(dimension: 26),
              const PrimaryTextFormField(
                label: 'Email ID',
              ),
              const SizedBox.square(dimension: 26),
              const PrimaryDropdownFormField(
                label: 'Gender*',
              ),
              const SizedBox.square(dimension: 26),
              const PrimaryTextFormField(
                label: 'Have a referral code? Enter it here',
              ),
              const SizedBox.square(dimension: 26),
              const PrimaryTextFormField(
                label: 'Address line 1*',
              ),
              const SizedBox.square(dimension: 26),
              const PrimaryTextFormField(
                label: 'Address line 2 (optional)',
              ),
              const SizedBox.square(dimension: 26),
              const PrimaryTextFormField(
                label: 'Pincode*',
              ),
              const SizedBox.square(dimension: 26),
              const PrimaryDropdownFormField(
                label: 'City*',
              ),
              const SizedBox.square(dimension: 26),
              const PrimaryDropdownFormField(
                label: 'State*',
              ),
              const SizedBox.square(dimension: 30),
              Center(
                child: PrimaryButton(
                  title: 'start shopping',
                  onPressed: () => rProvider.startShoppingButton(context),
                ),
              ),
              const SizedBox.square(dimension: 15),
              TermsConditionsWidget(
                checkState: wProvider.checkState,
                onCheckPressed: rProvider.onCheckFun,
              ),
              const SizedBox.square(dimension: 15),
            ],
          ),
        ),
      ),
    );
  }
}
