import 'package:get/get.dart';
import 'package:tradly_shope/data/datasource/fierstore_db.dart';
import '../model/categorie.dart';

class CategorieController extends GetxController {
  final categorie = <Categorie>[].obs;

  @override
  void onInit() {
    categorie.bindStream(FierstoreDB().getAllCategories());
    super.onInit();
  }
}
