

import 'package:flutter/cupertino.dart';
import 'package:tradly_shope/presentation/view/on_boarding/widget/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key, this.pageController}) : super(key: key);
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(controller: pageController,children: [
      PageViewItem(text: '    Empowering Artisans,\nFarmers & Micro Business',image: 'assets/images/board1.png',buttonText: 'Next',),
      PageViewItem(text: '    Connecting NGOs, Social\n Enterprises with Communities',image: 'assets/images/board2.png',buttonText: 'Next',),
      PageViewItem(text: '    Donate, Invest & Support\n      infrastructure projects',image: 'assets/images/board3.png',buttonText: 'Finish',),

    ],);
  }
}
