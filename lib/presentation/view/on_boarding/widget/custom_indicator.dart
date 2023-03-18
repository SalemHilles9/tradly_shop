import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../core/constances.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key? key,this.dotIndex}) : super(key: key);
  final double? dotIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.blue[100]!,
          activeColor: MainColor,
          // shape: RoundedRectangleBorder(
          //     side: BorderSide(color: Color(0xFF5ABD8C)),
          //     borderRadius: BorderRadius.circular(8)
         // )
      ),
      dotsCount: 3,
      position: dotIndex!,
    );
  }
}
