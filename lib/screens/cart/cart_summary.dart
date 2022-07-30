import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/cart/cart_screen.dart';
import 'package:poc/screens/cart/offers.dart';
import 'package:poc/screens/cart/providers/cart_provider.dart';
import 'package:poc/screens/cart/rating_page.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class CartSummary extends ConsumerWidget {
  const CartSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool addressSelect = true;
    final rProvider = ref.read(cartProvider);
    final wProvider = ref.watch(cartProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            PrimaryIconButton(
                              svg: Assets.assetsIconsChevLeft,
                              onPressed: () => Navigator.pop(context),
                            ),
                            // InkWell(
                            //   onTap: () {
                            //   },
                            //   child: const Icon(
                            //     Icons.arrow_back_ios,
                            //     color: Colors.black54,
                            //     size: 20,
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Image(
                                    image: AssetImage(
                                        "assets/icons/shoppingcart.png")),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Cart Summary", style: TextStyles.header),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "(17 items)",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            const InkWell(
                              child: Icon(Icons.keyboard_arrow_down),
                            ),
                          ],
                        ),
                        Visibility(
                            child: ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: Row(
                                              children: const [
                                                Image(
                                                  image: AssetImage(
                                                      "assets/images/ghee.png"),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Ghee (250 grams)",
                                                  style: TextStyles.subheader,
                                                ),
                                                Text('\u{20B9}${"50"}',
                                                    style: TextStyles.hint),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Row(
                                                  children: const [
                                                    Text("Delivery Plan: ",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)),
                                                    Text("Alternate"),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Row(
                                                  children: const [
                                                    Text("Delivery: ",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)),
                                                    Text("10-09-2022"),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Row(
                                                  children: const [
                                                    Text("Quantity: ",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)),
                                                    Text("1"),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                })),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Subtotal"),
                            Text('\u{20B9}${"1800"}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Taxes",
                              style: TextStyles.hint,
                            ),
                            Text('\u{20B9}${"100"}', style: TextStyles.hint),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discount",
                              style: TextStyles.hint,
                            ),
                            Text('-\u{20B9}${"50"}', style: TextStyles.hint),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    color: const Color(0xFFEEF9FF),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text("Offers"),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                            rProvider.appliedOffer == ""
                                ? Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Image(
                                                image: AssetImage(
                                                    "assets/icons/discount.png")),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text("Select a promo code"),
                                          ],
                                        ),
                                      ),
                                  Container(
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    const CartOffers()));
                                          },
                                          child: const Text(
                                            "VIEW OFFERS",
                                            style: TextStyle(
                                                fontSize: 14, color: Color(0xff193B61)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                    ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  )
                                : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                Assets.assetsIconsGreenTick),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            TextView(
                                              "${rProvider.appliedOffer} applied!",
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            PrimaryTextButton(
                                              title: "(Remove)",
                                              isUpperCase: false,
                                              showUnderline: true,
                                              onPressed: () {
                                                rProvider.onRemoveOffer();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),

                                      Container(
                                        child: Row(
                                          children: [
                                            TextView("-\u{20B9}${"350"}"),
                                          ],
                                        ),
                                      ),


                                    ],
                                  ),

                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total:",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: GoogleFonts.suranna().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                            const Text('\u{20B9}${"1850"}',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "CHOOSE ADDRESS",
                              style: TextStyle(
                                  color: Color(0xff193B61), fontSize: 14),
                            ),
                            Text(
                              "PAYMENT",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "My Address Book",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: GoogleFonts.suranna().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: true,
                                groupValue: addressSelect,
                                onChanged: (value) {
                                  print(value);
                                }),
                            const Text(
                              "Home",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        const Text(
                          "Akansha Das",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "2118,Thornidge Syracuse,Opposite Starbucks,Bandra East,Mumbai-356241,Maharasthra",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Phone Number: 9876432134",
                          style: TextStyle(fontSize: 15),
                        ),
                        Row(
                          children: [
                            Radio(
                                value: false,
                                groupValue: addressSelect,
                                onChanged: (value) {
                                  print(value);
                                }),
                            const Text(
                              "Parent's",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        const Text("Akshay Das"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "B-35, Sector-36,Near Cambridge Intl School, Noida- 201301, Uttar Pradesh",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: const [
                        Text(
                          "Phone Number: 9876432134",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                    onPressed: () {},
                    title: "Request a new address",
                    isRounded: true,
                    width: 20,
                    colorFill: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PrimaryTextButton(
                          title: 'Refund Policy',
                          isUpperCase: false,
                          showUnderline: true,
                          size: TextSize.textButton,
                          onPressed: () {},
                        ),
                        InkWell(
                          child: TextView(
                            "Privacy Policy",
                            textType: TextType.regular,
                            color: Palette.textColor,
                          ),
                        ),
                        const InkWell(
                          child: Text(
                            "Terms of service",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xFF193B61),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          PrimaryButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RatingPage()));
            },
            title: "Proceed to Payment",
            isExpanded: true,
            isRounded: false,
          ),
        ],
      ),
    );
  }
}
