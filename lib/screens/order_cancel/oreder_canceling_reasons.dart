// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:poc/screens/order_status/order_status_screen.dart';
// import 'package:poc/utils/dimensions.dart';
// import 'package:poc/utils/extensions.dart';
// import 'package:poc/utils/enums.dart';
// import 'package:poc/utils/utils.dart';
// import 'package:poc/widgets/appbar.dart';
// import 'package:poc/widgets/buttons.dart';
// import 'package:poc/widgets/checkbox.dart';
// import 'package:poc/widgets/text_view.dart';

// class OrderCancellingReasonScreen extends ConsumerWidget {
//   const OrderCancellingReasonScreen({Key? key, required this.orderType}) : super(key: key);

//   final OrderType orderType;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           const SecondaryAppBar(),
//           10.0.height,
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const TextView(
//                   'Why are you cancelling this?',
//                   size: TextSize.regularLarge,
//                 ),
//                 Dimensions.defaultPadding.height,
//                 _iconTile(text: 'Product was not up to quality', onChanged: (i) {}),
//                 15.0.height,
//                 _iconTile(text: 'Delivery is later than expected', onChanged: (i) {}),
//                 15.0.height,
//                 _iconTile(text: 'Product is not required anymore', onChanged: (i) {}),
//                 15.0.height,
//                 _iconTile(text: 'Change in delivery address', onChanged: (i) {}),
//                 15.0.height,
//                 _iconTile(text: 'Cash not available for COD', onChanged: (i) {}),
//                 15.0.height,
//                 _iconTile(text: 'Other', onChanged: (i) {}),
//                 30.0.height,
//                 Center(
//                   child: PrimaryButton(
//                     title: orderType == OrderType.oneTime ? 'cancel item' : 'request cancellation',
//                     onPressed: () => Utils.push(
//                       context,
//                       OrderStatusScreen(
//                         status: orderType == OrderType.oneTime ? EditOrderStatus.cancelled : EditOrderStatus.cancellationRequest,
//                       ),
//                     ),
//                     width: 240,
//                   ),
//                 ),
//                 Dimensions.defaultPadding.height,
//                 Center(
//                   child: PrimaryButton(
//                     title: 'discard changes',
//                     onPressed: () {},
//                     isFilled: false,
//                     width: 240,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Row _iconTile({required String text, required void Function(dynamic i) onChanged}) {
//     return Row(
//       children: [
//         PrimaryCheckbox(onChanged: onChanged),
//         5.0.width,
//         TextView(text),
//       ],
//     );
//   }
// }
