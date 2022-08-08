import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/screens/cart/cart_screen.dart';
import 'package:poc/screens/cart/cart_summary.dart';
import 'package:poc/screens/cart/providers/cart_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class CartOffers extends ConsumerWidget {
  const CartOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rProvider = ref.read(cartProvider);
    final wProvider = ref.watch(cartProvider);
    bool addressSelect = true;
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.09,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
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
                          "Apply Coupan",
                          style: TextStyles.drawerHeader,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.clear),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 305,
                      height: 46,
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: SizedBox(
                            height: 55.5,
                            width: 130,
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(color: Colors.transparent))),
                                  backgroundColor: MaterialStateProperty.all(const Color(0xFFF2F2F2))),
                              child: const Text(
                                "APPLY",
                                style: TextStyle(color: Color(0xffA6A6A6)),
                              ),
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(left: 20, bottom: 37),
                          labelText: "Enter Promo Code",
                          labelStyle: const TextStyle(color: Color(0xff808080)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffE5E5E5), width: 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffE5E5E5), width: 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text("Available Offers", style: TextStyles.drawerHeader),
                    Container(
                      child: ListView.builder(
                          padding: const EdgeInsets.only(),
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 15, right: 15),
                                  color: const Color(0xffF7F7F7),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("NEWFOUNDLOVE",
                                              style: TextStyle(
                                                  color: const Color(0xff193B61),
                                                  fontSize: 16,
                                                  fontFamily: GoogleFonts.suranna().fontFamily,
                                                  letterSpacing: 1)),
                                          InkWell(
                                            onTap: () {
                                              rProvider.onApplyOffer("NEWFOUNDLOVE", context);
                                            },
                                            child: const TextView(
                                              "APPLY OFFERS",
                                              color: Color(0xff193B61),
                                              size: 12,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox.square(
                                            dimension: 100,
                                            child: Image(image: AssetImage("assets/images/paneer.png")),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width - 218,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '\u{20B9}${"500"} Discount',
                                                  style: TextStyle(fontFamily: GoogleFonts.suranna().fontFamily, fontSize: 20),
                                                ),
                                                const TextView(
                                                  "Get 5 off upto \u{20B9}${"500"} on your first purchase.",
                                                  size: 14,
                                                  maxLines: 3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const TextView(
                                        "Valid on orders with items worth \u{20B9}${"159"} or more.",
                                        size: 14,
                                        color: Palette.hintColor,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
