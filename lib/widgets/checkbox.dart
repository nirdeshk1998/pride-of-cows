import 'package:flutter/material.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/widgets/buttons.dart';

class PrimaryCheckbox extends StatefulWidget {
  const PrimaryCheckbox({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final Function(bool value) onChanged;

  @override
  State<PrimaryCheckbox> createState() => _PrimaryCheckboxState();
}

class _PrimaryCheckboxState extends State<PrimaryCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return PrimaryIconButton(
      svg: _isChecked ? Assets.assetsIconsCheckboxChecked : Assets.assetsIconsCheckboxUnchecked,
      onPressed: onPressed,
      size: 20.0,
    );
  }

  void onPressed() => setState(() {
        _isChecked = !_isChecked;
        widget.onChanged(_isChecked);
      });
}
