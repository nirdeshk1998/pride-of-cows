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

class CartOffers extends ConsumerWidget {
  const CartOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final rProvider=ref.read(cartProvider);
   final wProvider=ref.watch(cartProvider);
    bool addressSelect = true;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                            style: TextStyles.header,
                          ),
                          const Icon(Icons.clear),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.12,
                            height: 55,
                            child: TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: SizedBox(
                                  height: 55.5,
                                  width: 130,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Apply",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side: const BorderSide(color: Colors.transparent))),
                                        backgroundColor: MaterialStateProperty.all(const Color(0xFFF2F2F2))),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(left: 20, bottom: 37),
                                labelText: "Enter Promo Code",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Text(
                        "Available Offers",
                        style: TextStyles.header,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (_, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("NEWFOUNDLOVE",
                                          style: TextStyle(
                                              color: const Color(0xff193B61),
                                              fontSize: 18,
                                              fontFamily: GoogleFonts.suranna().fontFamily,
                                              letterSpacing: 1)),
                                      InkWell(
                                        onTap: (){
                                          rProvider.onApplyOffer("NEWFOUNDLOVE",context);
                              },
                                        child: const Text(
                                          "APPLY OFFERS",
                                          style: TextStyle(color: Color(0xff193B61), fontSize: 17),
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
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width - 180,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\u{20B9}${"500"} Discount',
                                              style: TextStyle(fontFamily: GoogleFonts.suranna().fontFamily, fontSize: 20),
                                            ),
                                            const Text(
                                              "Get 5 off upto \u{20B9}${"500"} on your first purchase.",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Valid on orders with items worth \u{20B9}${"159"} or more.",
                                    style: const TextStyle(fontSize: 17, color: Colors.grey),
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
      ),
    );
  }
}
