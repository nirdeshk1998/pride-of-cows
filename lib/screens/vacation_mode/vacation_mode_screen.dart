import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/vacation_mode/providers/vacation_mode_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class VacationModeScreen extends ConsumerWidget {
  const VacationModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(vacationModeProvider);
    final read = ref.read(vacationModeProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => read.initState(context),
    );

    return Scaffold(
      body: Column(
        children: [
          SecondaryAppBar(
            sIcon: Assets.assetsIconsHamburger,
            sOnPressed: () {},
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
              children: [
                10.0.height,
                TextView(
                  'Vacation Mode',
                  textType: TextType.header,
                  color: Palette.textColor,
                ),
                TextView(
                  'Set vacation mode to pause your subscriptions and deliveries.',
                  textType: TextType.subtitle,
                  color: Palette.hintColor,
                  height: 1.5,
                  maxLines: 2,
                ),
                30.0.height,
                Row(
                  children: [
                    TextView(
                      'Turn on vacation mode',
                      textType: TextType.subtitle,
                      color: Palette.textColor,
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      activeColor: Palette.successColor,
                      value: watch.vacationMode,
                      onChanged: (i) => read.vacationModeFun(i),
                    ),
                  ],
                ),
                Dimensions.defaultPadding.height,
                _labelField(
                  label: 'Starts*',
                  hint: 'Select start date',
                  value: watch.startDate?.toddMMyyyy(),
                  onPressed: () async {
                    final startDate = await showDatePicker(
                      context: context,
                      initialDate: watch.startDate ?? watch.today,
                      firstDate: watch.today,
                      lastDate: DateTime(watch.today.year + 1),
                    );

                    read.onSelectStartDate(startDate);
                  },
                ),
                30.0.height,
                _labelField(
                  label: 'Ends',
                  hint: 'Select end date (optional)',
                  value: watch.endDate?.toddMMyyyy(),
                  onPressed: () async {
                    final endDate = await showDatePicker(
                      context: context,
                      initialDate: watch.startDate ?? watch.today,
                      firstDate: watch.today,
                      lastDate: DateTime(watch.today.year + 1),
                    );

                    read.onSelectEndDate(endDate);
                  },
                ),
                30.0.height,
                Center(
                  child: PrimaryButton(
                    title: 'save changes',
                    width: 180,
                    onPressed: () => read.onSaveChangesButton(),
                    padding: EdgeInsets.zero,
                  ),
                ),
                Dimensions.defaultPadding.height,
                Center(
                  child: PrimaryButton(
                    title: 'cancel',
                    width: 180,
                    isFilled: false,
                    onPressed: () => Utils.pop(context),
                    padding: EdgeInsets.zero,
                  ),
                ),
                Dimensions.defaultPadding.height,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack _labelField({
    required String label,
    String? hint,
    String? value,
    VoidCallback? onPressed,
  }) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          height: 50,
          width: double.maxFinite,
          margin: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Palette.surfaceColor),
            borderRadius: BorderRadius.circular(100),
          ),
          child: CupertinoButton(
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            minSize: 0,
            child: Row(
              children: [
                Dimensions.defaultPadding.width,
                SizedBox.square(
                  dimension: Dimensions.fieldIcon,
                  child: SvgPicture.asset(Assets.assetsIconsCalender2),
                ),
                10.width,
                SizedBox.square(
                  dimension: 12,
                  child: SvgPicture.asset(Assets.assetsIconsChevronDownThin),
                ),
                12.width,
                if (value == null)
                  TextView(
                    hint,
                    textType: TextType.hint,
                    color: Palette.hintColor,
                  )
                else
                  TextView(
                    value,
                    textType: TextType.hint,
                    color: Palette.textColor,
                  ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Material(
            color: Palette.scaffoldBackgroundColor,
            child: TextView(
              label,
              textType: TextType.label,
              color: Palette.hintColor,
            ),
          ),
        ),
      ],
    );
  }
}
