import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tradly_shope/core/constances.dart';
import 'package:tradly_shope/presentation/controller/top_image_Controller.dart';
import 'package:tradly_shope/presentation/view/custom_widgets/custom_app_bar.dart';
import 'package:tradly_shope/presentation/view/details/bread_detail.dart';
import '../../../controller/categorie_controller.dart';
import '../../../controller/product_controller.dart';
import '../../details/beverages_detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final topImageController = Get.put(TopImageController());
  final categorieController = Get.put(CategorieController());
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Groceries',
      ),
      body: ListView(
        children: [
          Container(
            color: MainColor,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
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
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: _mediaQuery.width * 1,
                      height: _mediaQuery.height * 0.23,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: topImageController.topImages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Image(index: index);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: _mediaQuery.width * 1,
                    height: _mediaQuery.height * 0.23,
                    child: GridView.builder(
                      // scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: categorieController.categorie.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Categorie(index: index);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 15,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Product',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: MainColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24),
                          child: Text(
                            'See All',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: _mediaQuery.width * 1,
                  height: _mediaQuery.height * 0.28,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productController.product.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CProduct(index: index);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 15,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Product',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: MainColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24),
                          child: Text(
                            'See All',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: _mediaQuery.width * 1,
                  height: _mediaQuery.height * 0.28,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productController.product.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CProduct(index: index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Image extends StatelessWidget {
  final TopImageController topImageController = Get.find();
  final int index;

  Image({required this.index});

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return index == 0
        ? Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 5, left: 10),
                child: Container(
                  width: _mediaQuery.width * 0.83,
                  height: _mediaQuery.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                        "${topImageController.topImages[index].imageUrl}",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: _mediaQuery.width * 0.83,
                        height: _mediaQuery.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'READY TO DELIVER TO\nYOUR HOME',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Text(
                                  'START SHOPPING',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        : Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 10, left: 5),
                child: Container(
                  width: _mediaQuery.width * 0.83,
                  height: _mediaQuery.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                        "${topImageController.topImages[index].imageUrl}",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

class Categorie extends StatelessWidget {
  final CategorieController categorieController = Get.find();
  final int index;

  Categorie({required this.index});

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Row(
      children: [
        InkWell(
          onTap: () {
            // index == 0 ? Get.to(BeveragesDetail()) : Get.to(BreadDetail());
            switch (index) {
              case 3:
                Get.to(BreadDetail());
                break;
              case 4:
                Get.to(BeveragesDetail());
                break;
            }
          },
          child: Container(
            width: _mediaQuery.width * 0.25,
            height: _mediaQuery.height * 0.11,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "${categorieController.categorie[index].imageUrl}",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  width: _mediaQuery.width * 0.25,
                  height: _mediaQuery.height * 0.11,
                  color: Colors.black.withOpacity(0.3),
                ),
                Center(
                  // child: Padding(
                  //   padding: const EdgeInsets.only(left: 15, top: 40),
                  child: Text(
                    "${categorieController.categorie[index].name}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
