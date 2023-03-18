import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tradly_shope/presentation/view/custom_widgets/custom_button.dart';
import '../../../core/constances.dart';
import '../../controller/product_controller.dart';
import '../../controller/wishlist_controller.dart';

class ProductDetail extends StatelessWidget {
  final productController = Get.put(ProductController());
  final wishlistController = Get.put(WishlistController());
  ProductDetail({Key? key, required this.index,}) : super(key: key);
  // final ProductController productController = Get.find();
  final int index;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: BackgroundColor,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: _mediaQuery.width * 1,
                  height: _mediaQuery.height * 0.28,
                  child: Image.network(
                    "${productController.product[index].imageUrl}",
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundColor:
                                  Colors.grey.shade300.withOpacity(0.4),
                              radius: 18,
                              child: InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                            },
                            child: CircleAvatar(
                                backgroundColor:
                                    Colors.grey.shade300.withOpacity(0.4),
                                radius: 18,
                                child: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: (){
                              !isLiked;
                            },
                            child: CircleAvatar(
                                backgroundColor:
                                Colors.grey.shade300.withOpacity(0.4),
                                radius: 18,
                                child: Icon(
                                isLiked == true ? Icons.favorite : Icons.favorite_border,
                                  color: isLiked == true ? Colors.red : Colors.white,
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                              backgroundColor:
                                  Colors.grey.shade300.withOpacity(0.4),
                              radius: 18,
                              child: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${productController.product[index].name}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${productController.product[index].price}",
                              style: TextStyle(
                                  color: MainColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('50\% off')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: MainColor,
                              child: Text(
                                'T',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Tradly Store',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Container(
                          width: _mediaQuery.width * 0.25,
                          height: _mediaQuery.height * 0.04,
                          decoration: BoxDecoration(
                            color: MainColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            'Follow',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lobortis cras placerat diam ipsum ut. Nisi vel adipiscing massa bibendum diam. Suspendisse mattis dui maecenas duis mattis. Mattis aliquam at arcu, semper nunc, venenatis et pellentesque eu. Id tristique maecenas tristique habitasse eu elementum sed. Aliquam eget lacus, arcu, adipiscing eget feugiat in dolor sagittis.
                      
Non commodo, a justo massa porttitor sed placerat in. Orci tristique etiam tempus sed. Mi varius morbi egestas dictum tempor nisl. In ''',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: CustomButton(buttonText: 'Add To Cart',color: MainColor,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
