import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/cart/cart_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/buttons.dart';

class CartSummary extends ConsumerWidget {
  const CartSummary({Key? key}) : super(key: key);

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
                  children: [
                    Row(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartScreen()));
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black54,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Image(
                                    image: AssetImage(
                                        "assets/icons/shoppingcart.png")),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Cart Summary", style: TextStyles.header),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "(17 items)",
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: InkWell(
                            child: Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                color: Color(0xFFEEF9FF),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Offers"),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Image(
                                  image:
                                      AssetImage("assets/icons/discount.png")),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Select a promo code"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "VIEW OFFERS",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff193B61)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
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
                          "Total:",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text('\u{20B9}${"1850"}',
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "CHOOSE ADDRESS",
                          style:
                              TextStyle(color: Color(0xff193B61), fontSize: 14),
                        ),
                        Text(
                          "PAYMENT",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "My Address Book",
                          style: TextStyle(fontSize: 18),
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
                        Text("Home",style: TextStyle(fontSize: 18),),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Text("Akansha Das",style: TextStyle(fontSize: 15),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("2118,Thornidge Syracuse,Opposite Starbucks,Bandra East,Mumbai-356241,Maharasthra",style: TextStyle(fontSize: 15),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Phone Number: 9876432134",style: TextStyle(fontSize: 15),),
                    Row(
                      children: [
                        Radio(
                            value: true,
                            groupValue: addressSelect,
                            onChanged: (value) {
                              print(value);
                            }),
                        Text("Parent's",style: TextStyle(fontSize: 18),),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Text("Akshay Das"),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: PrimaryButton(onPressed: (){},title: "HEllo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
