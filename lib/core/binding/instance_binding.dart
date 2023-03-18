import 'package:get/get.dart';
import 'package:tradly_shope/presentation/controller/categorie_controller.dart';
import 'package:tradly_shope/presentation/controller/product_controller.dart';

import '../../presentation/controller/auth_controller.dart';
import '../../presentation/controller/top_image_Controller.dart';

class InstanceBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AuthController>(() => AuthController());
    // Get.lazyPut<TopImageController>(() => TopImageController());
    // Get.lazyPut<CategorieController>(() => CategorieController());
    // Get.lazyPut<ProductController>(() => ProductController());
  }

}