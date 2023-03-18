import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constances.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    Key,
    this.text,
    this.image,
    this.buttonText,
  });

  final String? text;
  final String? image;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: MainColor,
                  width: double.infinity,
                  height: _mediaQuery.height * .4,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170, left: 25, right: 25),
              child: Column(
                children: [
                  Container(
                    height: _mediaQuery.height * .4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset(image!),
                  ),
                  SizedBox(
                    height: _mediaQuery.height * .05,
                  ),
                  Text(
                    text!,
                    // '    Empowering Artisans,\nFarmers & Micro Business',
                    style: TextStyle(color: MainColor,fontSize: 20,fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: _mediaQuery.height * .15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
