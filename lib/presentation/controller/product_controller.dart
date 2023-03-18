import 'package:get/get.dart';
import 'package:tradly_shope/data/datasource/fierstore_db.dart';
import 'package:tradly_shope/presentation/model/product.dart';

class ProductController extends GetxController {
  final product = <Product>[].obs;

  @override
  void onInit() {
    product.bindStream(FierstoreDB().getAllProducts());
    super.onInit();
  }
}
