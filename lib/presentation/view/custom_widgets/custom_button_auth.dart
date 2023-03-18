import 'package:flutter/material.dart';

import '../../../core/constances.dart';


class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({Key? key,this.buttonText,this.onPressed}) : super(key: key);
  final String? buttonText;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;

    return MaterialButton(
      onPressed: onPressed,
      color: Colors.white,
        elevation: 3,
        height: _mediaQuery.height * 0.065,
        minWidth: _mediaQuery.width * 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide.none),
        child: Text(
          buttonText!,
          style: TextStyle(
              color: MainColor,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      );
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 25,),
    //
    //     child: Container(
    //         decoration: BoxDecoration(
    //           color: color!,
    //           borderRadius: BorderRadius.circular(40),
    //         ),
    //         child: Center(child: Text(buttonText!,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),))),
    //   ),
    // );
  }
}
