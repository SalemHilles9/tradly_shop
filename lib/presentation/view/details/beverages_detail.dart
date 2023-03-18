import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tradly_shope/presentation/controller/product_controller.dart';
import 'package:tradly_shope/presentation/view/custom_widgets/border_button.dart';
import 'package:tradly_shope/presentation/view/details/product_detail.dart';
import '../../../core/constances.dart';
import '../custom_widgets/custom_back_app_bar.dart';

class BeveragesDetail extends StatefulWidget {
  const BeveragesDetail({Key? key}) : super(key: key);

  @override
  _BeveragesDetailState createState() => _BeveragesDetailState();
}

class _BeveragesDetailState extends State<BeveragesDetail> {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: CustomBackAppBar(
        text: 'Beverages',
      ),
      body: ListView(
        children: [
          Container(
            color: MainColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
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

class CProduct extends StatelessWidget {
  final ProductController productController = Get.find();
  final int index;

  CProduct({required this.index});

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Get.to(ProductDetail(index: index,));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: _mediaQuery.width * 0.42,
              height: _mediaQuery.height * 0.24,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white),
              child: Column(
                children: [
                  Container(
                    width: _mediaQuery.width * 0.42,
                    height: _mediaQuery.height * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(
                          "${productController.product[index].imageUrl}",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${productController.product[index].name}',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: MainColor,
                          child: Text(
                            'T',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          '\$${productController.product[index].price}',
                          style: TextStyle(
                              color: MainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
