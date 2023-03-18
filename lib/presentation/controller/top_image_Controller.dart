import 'package:get/get.dart';
import 'package:tradly_shope/data/datasource/fierstore_db.dart';
import 'package:tradly_shope/presentation/model/top_image.dart';

class TopImageController extends GetxController {
  final topImages = <TopImage>[].obs;

  @override
  void onInit() {
    topImages.bindStream(FierstoreDB().getAllTopImages());
    super.onInit();
  }
}
