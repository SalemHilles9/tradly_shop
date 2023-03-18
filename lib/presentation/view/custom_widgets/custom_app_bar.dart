import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/constances.dart';
import '../cart/cart_screen.dart';
import '../wishlist/wishlist_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.text}) : super(key: key);
  final String? text;

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MainColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Text(text!),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Get.to(WishlistScreen());
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.to(CartScreen());
              },
              icon: Icon(
                Icons.local_grocery_store,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
