import 'package:flutter/material.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class PrimaryCounterWidget extends StatefulWidget {
  const PrimaryCounterWidget({
    Key? key,
    required this.onCounterChanged,
  }) : super(key: key);

  final void Function(int i) onCounterChanged;

  @override
  State<PrimaryCounterWidget> createState() => _PrimaryCounterWidgetState();
}

class _PrimaryCounterWidgetState extends State<PrimaryCounterWidget> {
  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryIconButton(
          svg: Assets.assetsIconsMinus,
          size: 16,
          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
          onPressed: onSubtract,
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 3,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Palette.outlineColor),
            borderRadius: BorderRadius.circular(100),
          ),
          child: TextView(
            _itemCount.toString(),
            color: Palette.textColor,
            height: 1,
            textAlign: TextAlign.center,
          ),
        ),
        PrimaryIconButton(
          svg: Assets.assetsIconsPlus,
          size: 16,
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          onPressed: onAdd,
        ),
      ],
    );
  }

  void onAdd() {
    setState(() {
      _itemCount = ++_itemCount;
      widget.onCounterChanged(_itemCount);
    });
  }

  void onSubtract() {
    if (_itemCount > 1) {
      setState(() {
        _itemCount = --_itemCount;
        widget.onCounterChanged(_itemCount);
      });
    }
  }
}
