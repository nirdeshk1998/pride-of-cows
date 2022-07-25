import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/text_view.dart';

class OrderHelp extends ConsumerWidget {
  const OrderHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SecondaryAppBar(),
            10.0.height,
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPadding),
              child: TextView(
                'Order & My Account',
                textType: TextType.header,
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView("What Forms of payment do you accept?",size: 16,fontWeight: FontWeight.w700,),
                SizedBox(
                  height: 10,
                ),
                TextView("We accept PayPal and all major debit/credit cards.",size: 16,color: Palette.hintColor,),
                SizedBox(
                  height: 20,
                ),
                TextView("I have emailed customer service, why haven’t I heard back yet?",size: 16,fontWeight: FontWeight.w700,maxLines: 2),
                SizedBox(
                  height: 10,
                ),
                TextView("Pride of Cows is based in India and our business days are Monday to Friday. We aim to respond to all inquiries within forty-eight hours, so hold tight—we’ll get back to you as soon as we can.",size: 16,color: Palette.hintColor,maxLines: 10,),

                SizedBox(
                  height: 20,
                ),
                TextView("When will I be billed?",size: 16,fontWeight: FontWeight.w700,maxLines: 2),
                SizedBox(
                  height: 10,
                ),
                TextView("Your account is billed upon the first shipment of your order, unless otherwise noted. This includes items shipped immediately, personalized items, and preorder items.",size: 16,color: Palette.hintColor,maxLines: 10,),
                SizedBox(
                  height: 20,
                ),
                TextView("Can I edit or cancel my order?",size: 16,fontWeight: FontWeight.w700,maxLines: 2),
                SizedBox(
                  height: 10,
                ),
                TextView("Any amendments or cancellations to orders must be made within twenty-four hours of placing the order. Please email",size: 16,color: Palette.hintColor,maxLines: 10,),
                SizedBox(
                  height: 5,
                ),
                TextView("customerservice@prideofcows.com",size: 16,color: Color(0xff193B61),maxLines: 10,decoration: TextDecoration.underline,),
              ],
            ),),



          ],
        ),
      ),

    );
  }
}

