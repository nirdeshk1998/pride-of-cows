import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/my_wallet/providers/my_wallet_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/text_view.dart';

class MyWalletScreen extends ConsumerWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(myWalletProvider);
    final watch = ref.watch(myWalletProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => read.initState(context),
    );

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SecondaryAppBar(),
          10.0.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: TextView(
              'My Wallet',
              textType: TextType.header,
            ),
          ),
          10.0.height,
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    height: 46,
                    margin: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(color: Palette.selectedTabColor),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TabBar(
                      padding: EdgeInsets.zero,
                      splashBorderRadius: BorderRadius.circular(100),
                      indicator: BoxDecoration(
                        color: Palette.selectedTabColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelStyle: TextType.primaryButton.apply(
                        heightFactor: 1.3,
                        color: Palette.primaryColor,
                      ),
                      tabs: [
                        Tab(text: 'add money'.toUpperCase()),
                        Tab(text: 'transactions'.toUpperCase()),
                      ],
                    ),
                  ),
                  15.0.height,
                  Expanded(
                    child: TabBarView(
                      children: [
                        _addMoneyTab(context),
                        _transactionsTab(context, watch),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Widget?> _howItWorksbottomSheet(BuildContext context) {
    return Utils.showPrimaryBottomSheet(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryIconButton(
                  svg: Assets.assetsIconsClose,
                  onPressed: () => Utils.pop(context),
                ),
              ],
            ),
            _menuListTileButton(
              title: LocalString.howItWorks,
              icon: Assets.assetsIconsInfoRound,
              vertical: 0,
              iconSize: 18,
              fontSize: TextSize.subHeader,
              isBold: true,
              isUnderline: false,
              isCenter: true,
              color: Palette.textColor,
            ),
            10.0.height,
            const Divider(
              height: 1,
              thickness: 1,
              color: Palette.surfaceColor,
            ),
            Flexible(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  Dimensions.defaultPadding.height,
                  _sheetPoints(
                    point: '1',
                    text: LocalString.howItWorksWallet1,
                  ),
                  30.0.height,
                  _sheetPoints(
                    point: '2',
                    text: LocalString.howItWorksWallet2,
                  ),
                  30.0.height,
                  _sheetPoints(
                    point: '3',
                    text: LocalString.howItWorksWallet3,
                  ),
                  30.0.height,
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Palette.surfaceColor,
                  ),
                  30.0.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      TextView(
                        '\u2022  ',
                        color: Palette.hintColor,
                      ),
                      Expanded(
                        child: TextView(
                          LocalString.pocCashRbiGuidelines,
                          color: Palette.hintColor,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                  Dimensions.defaultPadding.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      TextView(
                        '\u2022  ',
                        color: Palette.hintColor,
                      ),
                      Expanded(
                        child: TextView(
                          LocalString.pocCashUsage,
                          color: Palette.hintColor,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                  30.0.height,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _sheetPoints({
    final String? point,
    final String? text,
  }) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: Dimensions.radius10,
            color: Palette.onPrimaryColor,
          ),
          child: Center(
            child: TextView(
              point,
              textType: TextType.header,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        5.0.height,
        TextView(
          text,
          maxLines: 6,
          height: 1.5,
          textAlign: TextAlign.center,
          color: Palette.textColor,
          size: TextSize.regularLarge,
        ),
      ],
    );
  }

  Widget _transactionsTab(BuildContext context, MyWalletChangeProvider watch) => Column(
        // padding: const EdgeInsets.symmetric(
        //   vertical: 15.0,
        // ),
        children: [
          Container(
            height: 60,
            width: double.maxFinite,
            color: Palette.selectedTabColor,
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  'Current Balance:',
                  textType: TextType.title,
                ),
                TextView(
                  '₹${watch.wallet?.balance}',
                  textType: TextType.header2,
                  height: 1.8,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: watch.cWalletTrans?.length ?? 0,
              // shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: Dimensions.defaultPadding,
                horizontal: Dimensions.defaultPadding,
              ),
              separatorBuilder: (context, index) => const Divider(
                height: 31,
                thickness: 1,
                color: Palette.surfaceColor,
              ),
              itemBuilder: (context, index) {
                final element = watch.cWalletTrans?[index];
                final isCredit = element?.type?.toLowerCase().contains('credit') ?? false;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextView(
                      element?.createdDate?.toddMMyy(),
                      textType: TextType.regular,
                      color: Palette.hintColor,
                    ),
                    5.0.height,
                    Row(
                      children: [
                        TextView(
                          'Paid for ${element?.detail} ',
                          textType: TextType.regular,
                          size: TextSize.regularLarge,
                          color: Palette.textColor,
                        ),
                        // const TextView(
                        //   '#155',
                        //   size: TextSize.regularLarge,
                        //   color: Palette.primaryColor,
                        //   decoration: TextDecoration.underline,
                        // ),
                        const Spacer(),
                        TextView(
                          '${isCredit ? '+' : '-'}${element?.paymentAmount}',
                          textType: TextType.title,
                          color: isCredit ? Palette.secondaryColor : Palette.textColor,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryIconButton(
                svg: Assets.assetsIconsArrowLeftLong,
                padding: const EdgeInsets.all(10.0),
                size: 25,
                onPressed: () {},
              ),
              Row(
                children: List.generate(
                  watch.numOfPages ?? 0,
                  (index) => PrimaryTextButton(
                    size: 14,
                    title: '${index + 1}',
                    color: Palette.primaryColor,
                    padding: const EdgeInsets.all(10.0),
                    weight: FontWeight.bold,
                    onPressed: () {},
                  ),
                ),
              ),
              // PrimaryTextButton(
              //   title: '1',
              //   color: Palette.primaryColor,
              //   size: 14,
              //   padding: const EdgeInsets.all(10.0),
              //   weight: FontWeight.bold,
              //   onPressed: () {},
              // ),
              // PrimaryTextButton(
              //   title: '2',
              //   color: Palette.lightTextColor,
              //   size: 14,
              //   padding: const EdgeInsets.all(10.0),
              //   weight: FontWeight.bold,
              //   onPressed: () {},
              // ),
              // PrimaryTextButton(
              //   title: '3',
              //   size: 14,
              //   color: Palette.lightTextColor,
              //   weight: FontWeight.bold,
              //   padding: const EdgeInsets.all(10.0),
              //   onPressed: () {},
              // ),
              PrimaryIconButton(
                svg: Assets.assetsIconsArrowRightLong,
                padding: const EdgeInsets.all(10.0),
                size: 25,
                onPressed: () {},
              ),
            ],
          ),
          10.0.height,
          const Divider(
            height: 1,
            thickness: 1,
            color: Palette.surfaceColor,
            indent: Dimensions.defaultPadding,
            endIndent: Dimensions.defaultPadding,
          ),
          5.0.height,
          _menuListTileButton(
            title: LocalString.howItWorks,
            horizontal: Dimensions.defaultPadding,
            icon: Assets.assetsIconsInfoRound,
            onPressed: () => _howItWorksbottomSheet(context),
          ),
          Dimensions.bottomSpace.height,
        ],
      );

  Widget _addMoneyTab(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: Dimensions.defaultPadding,
        ),
        children: [
          SizedBox(
            height: 170,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  Assets.assetsImagesWalletCard,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          Dimensions.defaultPadding.height,
          TextView(
            'Select an amount to add:',
            textType: TextType.regular,
            color: Palette.hintColor,
          ),
          10.0.height,
          SizedBox(
            height: 36,
            child: ListView.builder(
              itemCount: 4,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                bool isSelected = index == 0;

                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: Dimensions.radius10,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? Palette.primaryColor : null,
                        border: isSelected ? null : Border.all(color: Palette.outlineColor),
                        borderRadius: Dimensions.radius10,
                      ),
                      child: TextView(
                        ['₹500', '₹1000', '₹2000', '₹5000'][index],
                        textType: TextType.primaryButton,
                        color: isSelected ? Palette.onPrimaryColor : Palette.primaryColor,
                        height: 1.3,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          10.0.height,
          Center(
            child: TextView(
              'OR',
              textAlign: TextAlign.center,
              textType: TextType.regular,
              size: TextSize.regularSmall,
              color: Palette.hintColor,
            ),
          ),
          10.0.height,
          const PrimaryTextFormField(
            label: 'Enter a custom amount',
          ),
          30.0.height,
          Center(
            child: PrimaryButton(
              title: 'continue to payment',
              onPressed: () {},
            ),
          ),
          40.0.height,
          const Divider(
            height: 1,
            thickness: 1,
            color: Palette.surfaceColor,
          ),
          5.0.height,
          _menuListTileButton(
            title: 'How it works',
            icon: Assets.assetsIconsInfoRound,
            onPressed: () => _howItWorksbottomSheet(context),
          ),
          Dimensions.bottomSpace.height,
        ],
      );

  CupertinoButton _menuListTileButton({
    required final String title,
    required final String icon,
    final bool? isBold,
    final VoidCallback? onPressed,
    final double? horizontal,
    final double? vertical,
    final double? iconSize,
    final double? fontSize,
    final bool? isUnderline,
    final bool? isCenter,
    final Color? color,
  }) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(
        vertical: vertical ?? 5,
        horizontal: horizontal ?? 0,
      ),
      minSize: 0,
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: iconSize ?? 18,
            child: SvgPicture.asset(
              icon,
              color: Palette.goldenIconColor,
            ),
          ),
          const SizedBox.square(dimension: 5),
          TextView(
            title,
            textType: TextType.regular,
            size: fontSize,
            color: color ?? Palette.primaryColor,
            decoration: isUnderline == false ? null : TextDecoration.underline,
            fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          ),
          if (isCenter != true) const Spacer(),
        ],
      ),
    );
  }
}
