import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/screens/cart/cart_screen.dart';
import 'package:poc/screens/cart/cart_summary.dart';
import 'package:poc/screens/home/home_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class RatingPage extends ConsumerWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Color(0xffdff0f9),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: SvgPicture.asset("assets/icons/crown.svg"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Amoozing!",
                        style: TextStyles.header,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                TextView(
                  "Your order #98765 was completed succesfully",
                 textAlign: TextAlign.center,
                 size: 16,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    color: Color(0xffE2C29B),
                                    size: 50,
                                  ),
                                  Icon(Icons.star_border, color: Color(0xffE2C29B), size: 50),
                                  Icon(Icons.star_border, color: Color(0xffE2C29B), size: 50),
                                  Icon(Icons.star_border, color: Color(0xffE2C29B), size: 50),
                                  Icon(Icons.star_border, color: Color(0xffE2C29B), size: 50),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextView(
                                "Please rate your shopping experience",
                                size: 14,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              PrimaryButton(
                                title: "Submit Review",
                                isFilled: true,
                                onPressed: () {
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        height: 200,
                        width: MediaQuery.of(context).size.width / 1.3,
                      ),
                      Positioned(
                        child: CircleAvatar(
                          backgroundColor: Color(0xffdff0f9),
                          maxRadius: 10,
                        ),
                        left: 130,
                        right: 130,
                        top: -220,
                        bottom: 0,
                      ),
                      Positioned(
                          top: -30,
                          child: CircleAvatar(backgroundColor: Colors.white, child: SvgPicture.asset("assets/icons/Vector.svg"))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextView(
                  "For any queries or suggestion, connect at",
                 size: 16
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/phone.svg",
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "022-68156815",
                        style: TextStyle(color: Color(0xff193B61), fontSize: 18, decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                              width: 25,
                              height: 25,
                              child: Image(
                                image: AssetImage("assets/images/whatsapproundedborder.png"),
                                fit: BoxFit.fill,
                              )),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: SvgPicture.asset(
                              "assets/icons/whatsappicon.svg",
                              width: 15,
                              height: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "022-9876543210",
                          style: TextStyle(color: Color(0xff193B61), fontSize: 18, decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      child: Image(
                        image: AssetImage("assets/images/mail.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "bookings@prideofcows.com",
                        style: TextStyle(color: Color(0xff193B61), fontSize: 18, decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                PrimaryButton(title: "CONTINUE  SHOPPING", onPressed: () {}, isFilled: false),
              ],
            ),
          ),
        ));
  }
}
