import 'package:flutter/material.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/widgets/buttons.dart';

class RatingBar extends StatefulWidget {
  const RatingBar({
    Key? key,
    this.initialValue = 0,
    this.onChanged,
  }) : super(key: key);

  final int initialValue;
  final void Function(int val)? onChanged;

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  final List<bool> _star = List.filled(5, false);
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialValue;
    _star.fillRange(0, widget.initialValue, true);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) {
          // if (index == _rating) {
          //   _isRated = true;
          // } else {
          //   _isRated = false;
          // }

          return PrimaryIconButton(
            svg: _star[index] ? Assets.assetsIconsStarFilled : Assets.assetsIconsStar,
            size: 20.0,
            padding: EdgeInsets.only(right: index < 4 ? 5.0 : 0.0),
            onPressed: () {
              setState(() {
                // if (index < _selectedIndex) {
                //   print('hehe boi');
                // } else {
                //   print('yea boi')
                // }
                _star.fillRange(0, 5, false);
                _star.fillRange(0, index + 1, true);

                _selectedIndex = index;
              });

              if (widget.onChanged != null) {
                widget.onChanged!(index + 1);
              }
            },
          );
        },
      ),
    );
  }
}
