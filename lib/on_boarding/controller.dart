import 'package:get/get.dart';
import 'package:tradly_shope/on_boarding/local_storge.dart';

class OnBoardignController extends GetxController {
  int selectIndex = 0;

  changeIndex(int selectIndex) {
    this.selectIndex = selectIndex;
    update();
  }

  skipButton() async {
    await LcoalStorge.add("onBoarding", true);
  }



}
