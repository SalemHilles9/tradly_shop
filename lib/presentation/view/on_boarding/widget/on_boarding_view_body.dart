import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tradly_shope/presentation/view/on_boarding/widget/custom_indicator.dart';
import 'package:tradly_shope/presentation/view/on_boarding/widget/custom_page_view.dart';

import '../../../../core/constances.dart';
import '../../auth/login_screen.dart';
import '../../custom_widgets/custom_button.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  _OnBoardingViewBodyState createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;
  final box = GetStorage();


  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        CustomPageView(pageController: pageController),
        Positioned(
            left: 0,
            right: 0,
            bottom: _mediaQuery.height * 0.16,
            child: CustomIndicator(
              dotIndex: pageController!.hasClients ? pageController?.page : 0,
            )),
        Positioned(
          top: _mediaQuery.height * .9,
            child: CustomButton(
              color: MainColor,
              onPressed: () {
                if (pageController!.page! < 2) {
                  pageController?.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                } else {
                  box.write('isFirstTime', false);
                  Get.to(() => LoginScreen(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 500));
                }
              },
              buttonText: pageController!.hasClients
                  ? (pageController?.page == 2 ? 'Get started' : 'Next')
                  : 'Next',
            )),
      ],
    );
  }
}
