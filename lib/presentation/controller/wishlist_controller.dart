import 'package:get/get.dart';
import 'package:tradly_shope/presentation/model/product.dart';

class WishlistController extends GetxController {

  RxList<Product> fruitList = [Product()].obs;
  RxList tempFruitList = [].obs;

  addToFavourite(Product product) {
    tempFruitList.add(product);
  }

  removeFromFavourite(Product product) {
    tempFruitList.remove(product);
  }
}
