import 'package:flutter/material.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class PrimaryCounter extends StatefulWidget {
  const PrimaryCounter({
    Key? key,
    required this.onCounterChanged,
    this.initialCount,
    this.padding,
    this.isDisabled = false,
  }) : super(key: key);

  final void Function(int i) onCounterChanged;
  final int? initialCount;
  final EdgeInsets? padding;
  final bool isDisabled;

  @override
  State<PrimaryCounter> createState() => _PrimaryCounterState();
}

class _PrimaryCounterState extends State<PrimaryCounter> {
  int _itemCount = 1;

  @override
  void initState() {
    super.initState();
    _itemCount = widget.initialCount ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryIconButton(
          svg: Assets.assetsIconsMinus,
          size: 16,
          padding: widget.padding ?? const EdgeInsets.fromLTRB(0, 8, 8, 8),
          onPressed: widget.isDisabled ? null : onSubtract,
        ),
        Container(
          height: 25,
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
            textType: TextType.regular,
            height: 1,
            textAlign: TextAlign.center,
          ),
        ),
        PrimaryIconButton(
          svg: Assets.assetsIconsPlus,
          size: 16,
          padding: widget.padding ?? const EdgeInsets.fromLTRB(8, 8, 0, 8),
          onPressed: widget.isDisabled ? null : onAdd,
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
 