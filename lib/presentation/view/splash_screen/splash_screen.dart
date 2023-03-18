import 'package:flutter/material.dart';
import 'package:tradly_shope/presentation/view/splash_screen/widget/splash_body.dart';

import '../../../core/constances.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor,
      body: SplashBody(),
    );
  }
}
