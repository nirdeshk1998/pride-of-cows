// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:poc/constants/assets.dart';
// import 'package:poc/screens/menu/rewards/balance.dart';
// import 'package:poc/styles/colors.dart';
// import 'package:poc/styles/text_styles.dart';
// import 'package:poc/styles/widget_styles.dart';
// import 'package:poc/utils/dimensions.dart';
// import 'package:poc/utils/strings.dart';
// import 'package:poc/utils/utils.dart';
// import 'package:poc/utils/extensions.dart';
// import 'package:poc/widgets/appbar.dart';
// import 'package:poc/widgets/buttons.dart';
// import 'package:poc/widgets/form_fields.dart';
// import 'package:poc/widgets/text_view.dart';
//
// class Rewards extends ConsumerWidget {
//   const Rewards({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SecondaryAppBar(),
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Row(
//                   children: [
//                     Text('Rewards', style: TextStyles.header),
//                   ],
//                 ),
//                 Text("Redeem all rewards you have earned by using the redeem code during checkout.",
//                     style: TextStyle(fontSize: 18)),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Expanded(
//                   child: DefaultTabController(
//                     length: 2,
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 46,
//                           margin: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
//                           clipBehavior: Clip.antiAlias,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Palette.selectedTabColor),
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                           child: TabBar(
//                             padding: EdgeInsets.zero,
//                             splashBorderRadius: BorderRadius.circular(100),
//                             indicator: BoxDecoration(
//                               color: Palette.selectedTabColor,
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                             labelStyle: TextType.primaryButton.apply(
//                               heightFactor: 1.3,
//                               color: Palette.primaryColor,
//                             ),
//                             tabs: [
//                               Tab(text: 'rewards'.toUpperCase()),
//                               Tab(text: 'balance'.toUpperCase()),
//                             ],
//                           ),
//                         ),
//                         15.0.height,
//                         Expanded(
//                           child: TabBarView(
//                             children: [
//                               RewardTab(context),
//                               BalanceTab(context),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ]),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 20, right: 20),
//               child: Column(
//                 children: [
//                   Divider(
//                     thickness: 1,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   InkWell(
//                     onTap: () => _howItWorksBottomSheet(context),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 30.0,
//                           height: 30.0,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                             border: Border.all(
//                               color: Color(0xffD2AB68),
//                               width: 1.0,
//                             ),
//                           ),
//                           child: Center(
//                             child: TextView(
//                               "i",
//                               color: Color(0xffD2AB68),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         TextView("How it works?", size: 16, decoration: TextDecoration.underline),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<Widget?> _howItWorksBottomSheet(BuildContext context) {
//     return Utils.showPrimaryBottomSheet(
//       context,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             10.0.height,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 PrimaryIconButton(
//                   svg: Assets.assetsIconsClose,
//                   onPressed: () => Utils.pop(context),
//                 ),
//               ],
//             ),
//             _menuListTileButton(
//               title: 'How it Works',
//               icon: Assets.assetsIconsInfoRound,
//               vertical: 0,
//               iconSize: 18,
//               fontSize: TextSize.subHeader,
//               isBold: true,
//               isUnderline: false,
//               isCenter: true,
//               color: Palette.textColor,
//             ),
//             10.0.height,
//             const Divider(
//               height: 1,
//               thickness: 1,
//               color: Palette.surfaceColor,
//             ),
//             10.0.height,
//             Text.rich(
//               TextSpan(
//                 children: [
//                   const TextSpan(text: LocalString.loyaltySubtitle),
//                   TextSpan(
//                     text: 'Rewards',
//                     style: TextType.subtitle.apply(
//                       color: Palette.primaryColor,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                   const TextSpan(text: '.'),
//                 ],
//               ),
//               style: TextType.subtitle.apply(
//                 color: Palette.textColor,
//                 heightFactor: 1.5,
//               ),
//             ),
//             30.0.height,
//             _sheetPoints(
//               icon: Assets.assetsImagesSignIn,
//               text: LocalString.howItWorksLoyalty1,
//             ),
//             30.0.height,
//             _sheetPoints(
//               icon: Assets.assetsImagesCrown,
//               text: LocalString.howItWorksLoyalty2,
//             ),
//             30.0.height,
//             _sheetPoints(
//               icon: Assets.assetsImagesRedeemRewards,
//               text: LocalString.howItWorksLoyalty3,
//             ),
//             Dimensions.defaultPadding.height,
//             const Divider(
//               height: 1,
//               thickness: 1,
//               color: Palette.surfaceColor,
//             ),
//             Dimensions.defaultPadding.height,
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 TextView(
//                   '\u2022  ',
//                   color: Palette.hintColor,
//                 ),
//                 Expanded(
//                   child: TextView(
//                     LocalString.pocCashRbiGuidelines,
//                     color: Palette.hintColor,
//                     maxLines: 3,
//                   ),
//                 ),
//               ],
//             ),
//             40.0.height,
//           ],
//         ),
//       ),
//     );
//   }
//
//   CupertinoButton _menuListTileButton({
//     required final String title,
//     required final String icon,
//     final bool? isBold,
//     final VoidCallback? onPressed,
//     final double? horizontal,
//     final double? vertical,
//     final double? iconSize,
//     final double? fontSize,
//     final bool? isUnderline,
//     final bool? isCenter,
//     final Color? color,
//   }) {
//     return CupertinoButton(
//       padding: EdgeInsets.symmetric(
//         vertical: vertical ?? 5,
//         horizontal: horizontal ?? 0,
//       ),
//       minSize: 0,
//       onPressed: onPressed,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox.square(
//             dimension: iconSize ?? 18,
//             child: SvgPicture.asset(
//               icon,
//               color: Palette.goldenIconColor,
//             ),
//           ),
//           const SizedBox.square(dimension: 5),
//           TextView(
//             title,
//             textType: TextType.regular,
//             size: fontSize,
//             color: color ?? Palette.primaryColor,
//             decoration: isUnderline == false ? null : TextDecoration.underline,
//             fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
//           ),
//           if (isCenter != true) const Spacer(),
//         ],
//       ),
//     );
//   }
// }
//
// Column _sheetPoints({
//   required final String icon,
//   final String? text,
// }) {
//   return Column(
//     children: [
//       Container(
//           height: 60,
//           width: 60,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             borderRadius: Dimensions.radius10,
//             color: Palette.onPrimaryColor,
//           ),
//           child: Image.asset(icon)),
//       5.0.height,
//       TextView(
//         text,
//         maxLines: 6,
//         height: 1.5,
//         textAlign: TextAlign.center,
//         color: Palette.textColor,
//         size: TextSize.regularLarge,
//       ),
//     ],
//   );
// }
//
// Widget RewardTab(BuildContext context) => Column(
//       children: [
//         SizedBox(
//           height: 10,
//         ),
//         // Container(
//         //   width: MediaQuery.of(context).size.width,
//         //   height: 50,
//         //   color: Color(0xffEEF9FF),
//         //   child: Row(
//         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //     children: [
//         //       Row(
//         //         children: [
//         //           SizedBox(
//         //             width: 10,
//         //           ),
//         //           TextView(
//         //             "Current Crown Balance:",
//         //             size: 16,
//         //             fontWeight: FontWeight.bold,
//         //             color: Colors.black,
//         //           ),
//         //         ],
//         //       ),
//         //       Container(
//         //         child: Row(
//         //           children: [
//         //             SvgPicture.asset(
//         //               Assets.assetsIconsCrown,
//         //               height: 30,
//         //               width: 30,
//         //             ),
//         //             TextView(
//         //               "60",
//         //               fontWeight: FontWeight.bold,
//         //               color: Colors.black,
//         //               size: 18,
//         //             ),
//         //             SizedBox(
//         //               width: 15,
//         //             ),
//         //           ],
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         Container(
//           padding: EdgeInsets.only(left: 20, right: 20),
//           child: ListView.builder(
//               shrinkWrap: true,
//               physics: const ScrollPhysics(),
//               itemCount: 3,
//               itemBuilder: (_, index) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                         colors: [
//                           Color(0xffF6F3FB),
//                           Color(0xffEFF3FB),
//                         ],
//                         begin: Alignment.bottomRight,
//                         end: Alignment.topLeft,
//                       )),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextView(
//                                 "Use:",
//                                 size: 17,
//                                 color: Colors.black,
//                               ),
//                               Container(
//                                 child: Row(
//                                   children: [
//                                     SvgPicture.asset(
//                                       Assets.assetsIconsCrown,
//                                       height: 25,
//                                       width: 25,
//                                     ),
//                                     TextView(
//                                       "50",
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black,
//                                       size: 18,
//                                     ),
//                                     SizedBox(
//                                       width: 15,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextView(
//                                 "CROWN25",
//                                 size: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               InkWell(
//                                 onTap: () {},
//                                 child: Row(
//                                   children: [
//                                     TextView(
//                                       "REDEEM",
//                                       size: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     Icon(Icons.arrow_forward_outlined)
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Divider(
//                             thickness: 1,
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox.square(
//                                 dimension: 100,
//                                 child: Image(image: AssetImage("assets/images/paneer.png")),
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width - 180,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     TextView(
//                                       "50 % discount",
//                                       size: 18,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     SizedBox(
//                                       height: 7,
//                                     ),
//                                     const Text(
//                                       "Claim to win 250g paneer and a 250g curd combo for free",
//                                       style: TextStyle(
//                                         fontSize: 17,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     TextView(
//                                       "Valid till 20-02-22",
//                                       size: 16,
//                                       color: Palette.hintColor,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 );
//               }),
//         ),
//       ],
//     );
//
// Widget BalanceTab(BuildContext context) => Column(
//       children: [
//         Container(
//           padding: EdgeInsets.only(left: 20, right: 20),
//           child: ListView.builder(
//               shrinkWrap: true,
//               physics: const ScrollPhysics(),
//               itemCount: 10,
//               itemBuilder: (_, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     print(index.toInt());
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         decoration: index != 9
//                             ? BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 0)))
//                             : BoxDecoration(),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: [
//                                 TextView(
//                                   "25-11-21",
//                                   color: Palette.hintColor,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   child: Row(
//                                     children: [
//                                       SvgPicture.asset(
//                                         Assets.assetsIconsCrown,
//                                         height: 30,
//                                         width: 30,
//                                       ),
//                                       TextView(
//                                         "50",
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                         size: 18,
//                                       ),
//                                       SizedBox(
//                                         width: 15,
//                                       ),
//                                       TextView(
//                                         "NEW",
//                                         size: 18,
//                                       ),
//                                       SizedBox(
//                                         width: 3,
//                                       ),
//                                       TextView(
//                                         "redeemed",
//                                         size: 18,
//                                         color: Colors.black,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 TextView(
//                                   "+100",
//                                   size: 18,
//                                   color: Colors.green,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//         ),
//       ],
//     );
