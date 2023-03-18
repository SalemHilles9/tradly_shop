import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,this.buttonText,this.color,this.onPressed}) : super(key: key);
  final String? buttonText;
  final Color? color;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;

    return MaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: Container(
            width: _mediaQuery.width * 0.8,
            height: _mediaQuery.height * 0.06,
            decoration: BoxDecoration(
              color: color!,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(child: Text(buttonText!,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),))),
      ),
    );
  }
}
