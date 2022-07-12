import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/screens/cart/cart_screen.dart';
import 'package:poc/screens/cart/cart_summary.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/buttons.dart';

class RatingPage extends ConsumerWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xffdff0f9),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
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
                    child: Text("Order Updated!",style: TextStyles.header,),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              Text("Your order have been successfully updated. The changes will be reflected in your Pride Of Cows Calendar and Pride Of Cows Wallet in 24 hours.",style: TextStyle(fontSize: 18),),

            ],
          ),
        ),
      ),
    );
  }
}
