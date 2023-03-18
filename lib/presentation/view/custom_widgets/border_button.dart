import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({Key? key, this.text, this.icon}) : super(key: key);
  final String? text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: _mediaQuery.width * 0.29,
      height: _mediaQuery.height * 0.05,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(40),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              text!,
              style: TextStyle(color: Colors.white, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
