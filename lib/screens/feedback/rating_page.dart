import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class RatingPage extends ConsumerWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: const Color(0xffdff0f9),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/crown.svg"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Amoozing!",
                      style: TextStyles.header,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                const TextView(
                  "Your order #98765 was completed succesfully",
                 textAlign: TextAlign.center,
                 size: 16,
                ),
                const SizedBox(
                  height: 50,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      height: 200,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
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
                            const SizedBox(
                              height: 10,
                            ),
                            const TextView(
                              "Please rate your shopping experience",
                              size: 14,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            PrimaryButton(
                              title: "Submit Review",
                              isFilled: true,
                              onPressed: () {
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 130,
                      right: 130,
                      top: -220,
                      bottom: 0,
                      child: CircleAvatar(
                        backgroundColor: Color(0xffdff0f9),
                        maxRadius: 10,
                      ),
                    ),
                    Positioned(
                        top: -30,
                        child: CircleAvatar(backgroundColor: Colors.white, child: SvgPicture.asset("assets/icons/Vector.svg"))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextView(
                  "For any queries or suggestion, connect at",
                 size: 16
                ),
                const SizedBox(
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
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "022-68156815",
                        style: TextStyle(color: Color(0xff193B61), fontSize: 18, decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        const SizedBox(
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
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "022-9876543210",
                        style: TextStyle(color: Color(0xff193B61), fontSize: 18, decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: Image(
                        image: AssetImage("assets/images/mail.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "bookings@prideofcows.com",
                        style: TextStyle(color: Color(0xff193B61), fontSize: 18, decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(title: "CONTINUE  SHOPPING", onPressed: () {}, isFilled: false),
              ],
            ),
          ),
        ));
  }
}
