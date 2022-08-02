import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/contact_us/contact_us.dart';
import 'package:poc/screens/faq_&_links/faq_&_links.dart';
import 'package:poc/screens/gift_card/gift_card_screen.dart';
import 'package:poc/screens/loyalty_program/loyalty_program_screen.dart';
import 'package:poc/screens/address/my_address_book.dart';
import 'package:poc/screens/profile/my_profile.dart';

import 'package:poc/screens/my_wallet/my_wallet_screen.dart';
import 'package:poc/screens/orders/orders_screen.dart';
import 'package:poc/screens/notification/notification.dart';
import 'package:poc/screens/refer_&_earn/refer_&_earn.dart';
import 'package:poc/screens/rewards/rewards.dart';
import 'package:poc/screens/vacation_mode/vacation_mode_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const PrimaryAppBar(showSearch: false),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            color: Palette.surfaceBackgroundColor,
          ),
          child: Column(
            children: [
              const SizedBox.square(dimension: 10),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                horizontalTitleGap: 10,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmIh7V-Sq7K48WnUqtu18enb2Mnm_3fwnDJg&usqp=CAU',
                  ),
                ),
                title: TextView(
                  'Hi, John!',
                  textType: TextType.header2,
                  color: Palette.textColor,
                  height: 1,
                ),
                subtitle: TextView(
                  '9876543210',
                  textType: TextType.regular,
                  color: Palette.textColor,
                  size: TextSize.subHeader,
                ),
              ),
              const SizedBox.square(dimension: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _profileTile(
                          text: '₹900',
                          title: 'Wallet balance',
                          icon: Assets.assetsIconsWallet,
                        ),
                        const SizedBox.square(dimension: 10),
                        _profileTile(
                          text: '₹3000',
                          title: 'Monthly bill',
                          icon: Assets.assetsIconsBill,
                          gradColors: [
                            const Color(0xffbeefff),
                            const Color(0xff93e5ff),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox.square(dimension: 10),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _profileTile(
                          text: '2',
                          title: 'Upcoming deliveries',
                          icon: Assets.assetsIconsCart2,
                          gradColors: [
                            const Color(0xff8ed5ff),
                            const Color(0xffc2e8ff),
                          ],
                        ),
                        const SizedBox.square(dimension: 10),
                        _profileTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
                          },
                          text: '5',
                          title: 'Pending notifications',
                          icon: Assets.assetsIconsBell,
                          gradColors: [
                            const Color(0xffffe0bb),
                            const Color(0xfff0cb9e),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox.square(dimension: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    title: 'pay your monthly bill',
                    icon: Assets.assetsIconsArrowRight2,
                    width: 260,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox.square(dimension: 20),
            ],
          ),
        ),
        const SizedBox.square(dimension: 20),
        menuListSection(
          title: 'Order Details',
          children: [
            menuListTile(
              title: 'Orders',
              onTap: () => Utils.push(context, const OrdersScreen()),
              icon: Assets.assetsIconsCartRound,
            ),
            menuListTile(
              title: 'Vacation Mode',
              onTap: () => Utils.push(context, const VacationModeScreen()),
              icon: Assets.assetsIconsCalenderRound,
            ),
          ],
        ),
        menuListSection(
          title: 'Personal Information',
          children: [
            menuListTile(
              title: 'My Profile',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfile()));
              },
              icon: Assets.assetsIconsProfileRound,
            ),
            menuListTile(
              title: 'My Address Book',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyAddressBook()));
              },
              icon: Assets.assetsIconsAddressRound,
            ),
          ],
        ),
        menuListSection(
          title: 'Referrals and Credits',
          children: [
            menuListTile(
              title: 'My Wallet',
              onTap: () => Utils.push(context, const MyWalletScreen()),
              icon: Assets.assetsIconsWalletRound,
            ),
            menuListTile(
              title: 'Rewards',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Rewards()));
              },
              icon: Assets.assetsIconsRewardRound,
            ),
            menuListTile(
              title: 'Loyalty Program',
              onTap: () => Utils.push(context, const LoyaltyProgramScreen()),
              icon: Assets.assetsIconsLoyaltyRound,
            ),
            menuListTile(
              title: 'Refer and Earn',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReferAndEarn()));
              },
              icon: Assets.assetsIconsReferRound,
            ),
            menuListTile(
              title: 'Gift Card',
              onTap: () => Utils.push(context, const GiftCardScreen()),
              icon: Assets.assetsIconsGiftRound,
            ),
          ],
        ),
        menuListSection(
          title: 'Help and Support',
          children: [
            menuListTile(
              title: "FAQ's and Links",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FaqAndLinks()));
              },
              icon: Assets.assetsIconsFaqRound,
            ),
            menuListTile(
              title: 'Raise a Ticket',
              onTap: () {},
              icon: Assets.assetsIconsTicketRound,
            ),
            menuListTile(
              title: 'Contact Us',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
              },
              icon: Assets.assetsIconsContactUsRound,
            ),
          ],
        ),
        menuListSection(
          title: 'Learn more',
          bPadding: 10,
          children: [
            menuListTile(
              title: 'About Us',
              onTap: () {},
              icon: Assets.assetsIconsAboutUsRound,
            ),
            menuListTile(
              title: 'Lifestyle',
              onTap: () {},
              icon: Assets.assetsIconsLifestyleRound,
            ),
            menuListTile(
              title: 'Recipes',
              onTap: () {},
              icon: Assets.assetsIconsRecipeRound,
            ),
          ],
        ),
        menuListTileButton(icon: Assets.assetsIconsShare2, title: 'Share App'),
        menuListTileButton(icon: Assets.assetsIconsStar2, title: 'Rate App'),
        const SizedBox.square(dimension: 20),
        Center(
          child: PrimaryButton(
            title: 'log out',
            isFilled: false,
            onPressed: () {},
          ),
        ),
        const SizedBox.square(dimension: 20),
        Container(
          color: Palette.surfaceBackgroundColor,
          child: Column(
            children: [
              const SizedBox.square(dimension: 20),
              const TextView(
                'APP VERSION 1.1.2',
                size: TextSize.regularSmall,
                letterSpacing: 0.6,
                color: Palette.lightTextColor2,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox.square(dimension: 10),
              PrimaryTextButton(
                title: 'Update App',
                size: 14.0,
                isUpperCase: false,
                showUnderline: true,
                onPressed: () {},
              ),
              const SizedBox.square(dimension: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PrimaryIconButton(
                    size: 30,
                    svg: Assets.assetsIconsInstagram,
                    onPressed: () {},
                  ),
                  const SizedBox.square(dimension: 20),
                  PrimaryIconButton(
                    size: 30,
                    svg: Assets.assetsIconsFb,
                    onPressed: () {},
                  ),
                  const SizedBox.square(dimension: 20),
                  PrimaryIconButton(
                    size: 30,
                    svg: Assets.assetsIconsTwitter,
                    onPressed: () {},
                  ),
                  const SizedBox.square(dimension: 20),
                  PrimaryIconButton(
                    size: 30,
                    svg: Assets.assetsIconsYoutube,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox.square(dimension: 90),
            ],
          ),
        ),
      ],
    );
  }

  CupertinoButton menuListTileButton({
    required final String title,
    required final String icon,
  }) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      minSize: 0,
      child: Row(
        children: [
          SizedBox.square(
            dimension: 18,
            child: SvgPicture.asset(
              icon,
              color: Palette.goldenIconColor,
            ),
          ),
          const SizedBox.square(dimension: 5),
          TextView(
            title,
            color: Palette.primaryColor,
            decoration: TextDecoration.underline,
          ),
        ],
      ),
      onPressed: () {},
    );
  }

  Column menuListSection({
    required final List<Widget> children,
    required final String title,
    final double? bPadding,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextView(
            title,
            color: Palette.lightTextColor,
            height: 1,
          ),
        ),
        const SizedBox.square(dimension: 10),
        Column(
          children: children,
        ),
        const SizedBox.square(dimension: 10),
        const Divider(
          height: 1,
          thickness: 1,
          color: Palette.surfaceColor,
          indent: 20,
          endIndent: 20,
        ),
        SizedBox.square(dimension: bPadding ?? 20),
      ],
    );
  }

  InkWell menuListTile({
    required final VoidCallback onTap,
    required final String title,
    required final String icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
        child: Row(
          children: [
            SizedBox.square(
              dimension: 25,
              child: SvgPicture.asset(
                icon,
              ),
            ),
            const SizedBox.square(dimension: 8),
            TextView(
              title,
              color: Palette.textColor,
              size: TextSize.menuTitle,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _profileTile({
    List<Color>? gradColors,
    required String icon,
    required String text,
    required String title,
    final VoidCallback? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: gradColors ??
                  [
                    const Color(0xffffe3ca),
                    const Color(0xfff8b8a4),
                  ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox.square(
                    dimension: 24,
                    child: SvgPicture.asset(icon),
                  ),
                  const SizedBox.square(dimension: 5),
                  TextView(
                    text,
                    color: Palette.textColor,
                    textType: TextType.header2,
                    height: 1.35,
                    boxHeight: 28,
                  ),
                ],
              ),
              TextView(
                title,
                color: Palette.hintColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
