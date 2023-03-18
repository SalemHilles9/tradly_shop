import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tradly_shope/presentation/controller/splash_controller.dart';
import 'package:tradly_shope/presentation/view/on_boarding/on_boarding.dart';
import 'package:tradly_shope/presentation/view/splash_screen/splash_screen.dart';
import 'core/binding/instance_binding.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SplashController splashController = Get.put(SplashController());
  splashController.goToNextView();
  await GetStorage.init();
  runApp(MyApp());
}

final naviatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final bool _isFirstTime = box.read('isFirstTime') ?? true;

    return GetMaterialApp(
      initialBinding: InstanceBinding(),
      navigatorKey: naviatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: _isFirstTime ? OnBoardingView() : SplashView(),
       // SplashView(),
    );
  }
}
