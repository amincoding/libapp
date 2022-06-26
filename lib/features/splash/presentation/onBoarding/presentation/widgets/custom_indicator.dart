import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants.dart';

class customIndecator extends StatelessWidget {
  const customIndecator({Key? key, @required this.dotIndex}) : super(key: key);
  final double? dotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: dotIndex!,
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: KColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: KColor))),
    );
  }
}
