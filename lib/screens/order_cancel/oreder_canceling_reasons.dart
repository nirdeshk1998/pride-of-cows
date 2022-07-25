import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/checkbox.dart';
import 'package:poc/widgets/text_view.dart';

class OrderCancellingScreen extends ConsumerWidget {
  const OrderCancellingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          const SecondaryAppBar(),
          10.0.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TextView(
                  'Why are you cancelling this?',
                  size: TextSize.regularLarge,
                ),
                Dimensions.defaultPadding.height,
                _textTile(text: 'Product was not up to quality', onChanged: (i) {}),
                15.0.height,
                _textTile(text: 'Delivery is later than expected', onChanged: (i) {}),
                15.0.height,
                _textTile(text: 'Product is not required anymore', onChanged: (i) {}),
                15.0.height,
                _textTile(text: 'Change in delivery address', onChanged: (i) {}),
                15.0.height,
                _textTile(text: 'Cash not available for COD', onChanged: (i) {}),
                15.0.height,
                _textTile(text: 'Other', onChanged: (i) {}),
                30.0.height,
                Center(
                  child: PrimaryButton(
                    title: 'cancel item',
                    onPressed: () {},
                    width: 200,
                  ),
                ),
                Dimensions.defaultPadding.height,
                Center(
                  child: PrimaryButton(
                    title: 'discard changes',
                    onPressed: () {},
                    colorFill: false,
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _textTile({required String text, required void Function(dynamic i) onChanged}) {
    return Row(
      children: [
        PrimaryCheckbox(onChanged: onChanged),
        5.0.width,
        TextView(text),
      ],
    );
  }
}
