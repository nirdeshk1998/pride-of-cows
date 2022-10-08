// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:poc/constants/assets.dart';
// import 'package:poc/screens/offers/offers.dart';
// import 'package:poc/screens/cart/providers/cart_provider.dart';
// import 'package:poc/screens/cart/rating_page.dart';
// import 'package:poc/styles/text_styles.dart';
// import 'package:poc/utils/extensions.dart';
// import 'package:poc/widgets/buttons.dart';
// import 'package:poc/widgets/text_view.dart';
//
// class CartSummaryScreen extends ConsumerWidget {
//   const CartSummaryScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     bool addressSelect = true;
//     final read = ref.read(cartProvider);
//     final watch = ref.watch(cartProvider);
//
//     final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//     return Scaffold(
//       key: scaffoldKey,
//       endDrawer: const CartOffersDrawer(),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             PrimaryIconButton(
//                               svg: Assets.assetsIconsChevLeft,
//                               onPressed: () => Navigator.pop(context),
//                             ),
//                             // InkWell(
//                             //   onTap: () {
//                             //   },
//                             //   child: const Icon(
//                             //     Icons.arrow_back_ios,
//                             //     color: Colors.black54,
//                             //     size: 20,
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 const Image(image: AssetImage(Assets.assetsIconsShoppingcart)),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text("Cart Summary", style: TextStyles.header),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 const Text(
//                                   "(17 items)",
//                                   style: TextStyle(fontSize: 17),
//                                 ),
//                               ],
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 read.showAndHideItems();
//                               },
//                               child: watch.showItems ? const Icon(Icons.keyboard_arrow_up) : const Icon(Icons.keyboard_arrow_down),
//                             ),
//                           ],
//                         ),
//                         Visibility(
//                           visible: watch.showItems,
//                           child: ListView.builder(
//                             itemCount: 3,
//                             shrinkWrap: true,
//                             physics: const ScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               return Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       const SizedBox.square(
//                                         dimension: 100,
//                                         child: Image(
//                                           image: AssetImage(Assets.assetsImagesMilkProd),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                       10.0.width,
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             const SizedBox(
//                                               height: 20,
//                                             ),
//                                             TextView(
//                                               "Ghee (250 grams)",
//                                               textType: TextStyles.subheader,
//                                             ),
//                                             Text('\u{20B9}${"50"}', style: TextStyles.hint),
//                                             Row(
//                                               children: const [
//                                                 Text("Delivery Plan: ", style: TextStyle(color: Colors.grey)),
//                                                 Text("Alternate"),
//                                               ],
//                                             ),
//                                             const SizedBox(
//                                               height: 2,
//                                             ),
//                                             Row(
//                                               children: const [
//                                                 Text("Delivery: ", style: TextStyle(color: Colors.grey)),
//                                                 Text("10-09-2022"),
//                                               ],
//                                             ),
//                                             const SizedBox(
//                                               height: 2,
//                                             ),
//                                             Row(
//                                               children: const [
//                                                 Text("Quantity: ", style: TextStyle(color: Colors.grey)),
//                                                 Text("1"),
//                                                 Spacer(),
//                                                 Text("\u{20B9}100"),
//                                               ],
//                                             ),
//                                             const SizedBox(
//                                               height: 2,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                         const Divider(
//                           thickness: 1,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: const [
//                             TextView(
//                               "Subtotal",
//                               color: Color(0xff2B2B2B),
//                               fontWeight: FontWeight.w500,
//                               size: 14,
//                             ),
//                             TextView(
//                               '\u{20B9}${"1800"}',
//                               color: Color(0xff2B2B2B),
//                               fontWeight: FontWeight.w500,
//                               size: 14,
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Taxes",
//                               style: TextStyles.hint,
//                             ),
//                             Text('\u{20B9}${"100"}', style: TextStyles.hint),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Discount",
//                               style: TextStyles.hint,
//                             ),
//                             Text('-\u{20B9}${"50"}', style: TextStyles.hint),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     color: const Color(0xFFEEF9FF),
//                     child: Column(
//                       children: [
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             Text("Offers", style: TextStyle(fontFamily: GoogleFonts.suranna().fontFamily, fontSize: 16)),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 6,
//                         ),
//                         // rProvider.appliedOffer == ""
//                         //     ?
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: const [
//                                 Image(image: AssetImage(Assets.assetsIconsDiscount)),
//                                 SizedBox(
//                                   width: 3,
//                                 ),
//                                 Text("Select a promo code"),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     scaffoldKey.currentState!.openEndDrawer();
//                                   },
//                                   child: const Text(
//                                     "VIEW OFFERS",
//                                     style: TextStyle(fontSize: 12, color: Color(0xff193B61), fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         // : Row(
//                         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //     children: [
//                         //       Container(
//                         //         child: Row(
//                         //           children: [
//                         //             SvgPicture.asset(Assets.assetsIconsGreenTick),
//                         //             const SizedBox(
//                         //               width: 5,
//                         //             ),
//                         //             TextView(
//                         //               "${rProvider.appliedOffer} applied!",
//                         //               size: 16,
//                         //             ),
//                         //             const SizedBox(
//                         //               width: 5,
//                         //             ),
//                         //             PrimaryTextButton(
//                         //               title: "(Remove)",
//                         //               isUpperCase: false,
//                         //               showUnderline: true,
//                         //               onPressed: () {
//                         //                 rProvider.onRemoveOffer();
//                         //               },
//                         //             ),
//                         //           ],
//                         //         ),
//                         //       ),
//                         //       Container(
//                         //         child: Row(
//                         //           children: const [
//                         //             TextView("-\u{20B9}${"350"}"),
//                         //           ],
//                         //         ),
//                         //       ),
//                         //     ],
//                         //   ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     color: const Color(0x00fafafa),
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Total:",
//                               style: TextStyle(fontSize: 22, fontFamily: GoogleFonts.suranna().fontFamily, fontWeight: FontWeight.bold, letterSpacing: 1),
//                             ),
//                             const Text('\u{20B9}${"1850"}', style: TextStyle(fontSize: 20)),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: const [
//                             TextView(
//                               "CHOOSE ADDRESS",
//                               color: Color(0xff193B61),
//                               size: 12,
//                               fontWeight: FontWeight.w700,
//                             ),
//                             Text(
//                               "PAYMENT",
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                           ],
//                         ),
//                         const Divider(
//                           thickness: 1,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               "My Address Book",
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontFamily: GoogleFonts.suranna().fontFamily,
//                               ),
//                             ),
//                             const TextView(
//                               "  (2 saved)",
//                               size: 14,
//                             ),
//                           ],
//                         ),
//                         Container(
//                           color: const Color(0xfff8f6f6),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Radio(value: true, groupValue: addressSelect, onChanged: (value) {}),
//                                   const TextView(
//                                     "Home",
//                                     size: 18,
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 44),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Divider(
//                                       thickness: 1,
//                                     ),
//                                     TextView(
//                                       "Akansha Das",
//                                       size: 15,
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     TextView(
//                                       "2118,Thornidge Syracuse,Opposite Starbucks,Bandra East,Mumbai-356241,Maharasthra",
//                                       size: 15,
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     TextView(
//                                       "Phone Number: 9876432134",
//                                       size: 15,
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           color: const Color(0xfff8f6f6),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Radio(
//                                     value: false,
//                                     groupValue: addressSelect,
//                                     onChanged: (value) {},
//                                   ),
//                                   const TextView(
//                                     "Parent’s",
//                                     size: 18,
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 44),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Divider(
//                                       thickness: 1,
//                                     ),
//                                     TextView(
//                                       "Akshay Das",
//                                       size: 15,
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     TextView(
//                                       "B-35,  Sector-36, Near Cambridge Intl School, Noida - 201301, Uttar Pradesh",
//                                       size: 15,
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     TextView(
//                                       "Phone Number: 9876432134",
//                                       size: 15,
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   PrimaryButton(
//                     onPressed: () {},
//                     title: "Request a new address",
//                     isRounded: true,
//                     width: 20,
//                     isFilled: false,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Divider(
//                     thickness: 1,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, right: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         PrimaryTextButton(
//                           title: 'Refund Policy',
//                           isUpperCase: false,
//                           showUnderline: true,
//                           size: TextSize.textButton,
//                           onPressed: () {},
//                         ),
//                         PrimaryTextButton(
//                           title: 'Privacy Policy',
//                           isUpperCase: false,
//                           showUnderline: true,
//                           size: TextSize.textButton,
//                           onPressed: () {},
//                         ),
//                         PrimaryTextButton(
//                           title: 'Terms of service',
//                           isUpperCase: false,
//                           showUnderline: true,
//                           size: TextSize.textButton,
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           PrimaryButton(
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const RatingPage()));
//             },
//             title: "Proceed to Payment",
//             isExpanded: true,
//             isRounded: false,
//           ),
//         ],
//       ),
//     );
//   }
// }
