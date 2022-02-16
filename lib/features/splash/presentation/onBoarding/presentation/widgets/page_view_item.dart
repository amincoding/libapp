import 'package:flutter/material.dart';
import 'package:viplive/core/utils/sizeConfig.dart';

import '../../../../../../core/constants.dart';

class pageViewItem extends StatelessWidget {
  const pageViewItem({Key? key, this.subTitle, this.imagePath, this.title})
      : super(key: key);
  final String? title;
  final String? subTitle;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight! * 0.15,
        ),
        Image.asset(imagePath!),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.05,
        ),
        Text(
          title!,
          style: TextStyle(
              fontFamily: KFont,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.01,
        ),
        Center(
          child: Text(
            subTitle!,
            style: TextStyle(
              fontFamily: KFont,
              fontSize: 14,
              color: const Color(0xFF898989),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
