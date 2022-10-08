import 'package:flutter/material.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/widgets/buttons.dart';

class PrimaryCheckbox extends StatefulWidget {
  const PrimaryCheckbox({
    Key? key,
    this.size,
    this.value,
    required this.onChanged,
  }) : super(key: key);

  final Function(bool value) onChanged;
  final bool? value;
  final double? size;

  @override
  State<PrimaryCheckbox> createState() => _PrimaryCheckboxState();
}

class _PrimaryCheckboxState extends State<PrimaryCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    if (widget.value != null) {
      _isChecked = widget.value ?? false;
    }

    return PrimaryIconButton(
      svg: _isChecked ? Assets.assetsIconsCheckboxChecked : Assets.assetsIconsCheckboxUnchecked,
      onPressed: onPressed,
      size: widget.size ?? 20.0,
    );
  }

  void onPressed() => setState(() {
        _isChecked = !_isChecked;
        widget.onChanged(_isChecked);
      });
}

