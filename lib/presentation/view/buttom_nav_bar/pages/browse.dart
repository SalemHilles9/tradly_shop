import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tradly_shope/presentation/view/custom_widgets/custom_app_bar.dart';
import '../../../../core/constances.dart';
import '../../../controller/product_controller.dart';
import '../../custom_widgets/border_button.dart';
import '../../details/beverages_detail.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Browse',
      ),
      body: ListView(
        children: [
          Container(
            color: MainColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Container(
                    height: _mediaQuery.height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: MainColor),
                        label: Text('Search Product'),
                        labelStyle: TextStyle(color: Colors.grey.shade400),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    color: MainColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BorderButton(
                            text: 'Sort by',
                            icon: Icons.sort,
                          ),
                          BorderButton(
                            text: 'Location',
                            icon: Icons.location_on,
                          ),
                          BorderButton(
                            text: 'Category',
                            icon: Icons.list,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
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
          )
        ],
      ),
    );
  }
}
