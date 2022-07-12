import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/screens/cart/cart_screen.dart';
import 'package:poc/screens/cart/cart_summary.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/buttons.dart';

class CartOffers extends ConsumerWidget {
  const CartOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool addressSelect = true;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
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
                          Icon(Icons.clear),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.12,
                            height: 55,
                            child: TextFormField(
                              decoration: InputDecoration(
                                suffix: Container(
                                  height: 55.5,
                                  width: 130,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Apply",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                side: BorderSide(
                                                    color:
                                                        Colors.transparent))),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xFFF2F2F2))),
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 20, bottom: 37),
                                labelText: "Enter Promo Code",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Text(
                        "Available Offers",
                        style: TextStyles.header,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (BuildContext, index) {
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("NEWFOUNDLOVE",
                                            style: TextStyle(
                                                color: Color(0xff193B61),
                                                fontSize: 18,
                                                fontFamily:
                                                    GoogleFonts.suranna()
                                                        .fontFamily,
                                                letterSpacing: 1)),
                                       InkWell(
                                         onTap: (){
                                           Navigator.push(context,MaterialPageRoute(builder: (context)=>CartSummary()));
                                         },
                                         child:Text(
                                           "APPLY OFFERS",
                                           style: TextStyle(
                                               color: Color(0xff193B61),
                                               fontSize: 17),
                                         ),
                                       ),

                                      ],
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/images/paneer.png")),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              180,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '\u{20B9}${"500"} Discount',
                                                style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.suranna()
                                                            .fontFamily,
                                                    fontSize: 20),
                                              ),
                                              Container(
                                                child: Text(
                                                  "Get 5 off upto \u{20B9}${"500"} on your first purchase.",
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Valid on orders with items worth \u{20B9}${"159"} or more.",
                                      style: TextStyle(fontSize: 17,color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
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
