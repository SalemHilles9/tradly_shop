import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tradly_shope/presentation/controller/wishlist_controller.dart';
import 'package:tradly_shope/presentation/view/custom_widgets/custom_back_app_bar.dart';
import '../../controller/product_controller.dart';
import '../../model/product.dart';
import '../details/beverages_detail.dart';


class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final productController = Get.put(ProductController());
  final wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomBackAppBar(text: 'Wishlist',),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
        child: SizedBox(
          width: _mediaQuery.width * 1,
          height: _mediaQuery.height * 0.5,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
            ),
            itemCount: productController.product.length,
            itemBuilder: (BuildContext context, int index) {
              return CProduct(index: index);
            },
          ),
        ),
      ),
    );
  }
}
