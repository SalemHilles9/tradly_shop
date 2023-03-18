import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../view/auth/login_screen.dart';
import '../view/buttom_nav_bar/bottom_nav_bar_view.dart';

class SplashController extends GetxController {

  void goToNextView() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CupertinoActivityIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Somthing went wrong!'),
              );
            } else if (snapshot.hasData) {
              return const BottomNavBarView();
            } else {
              return const LoginScreen();
            }
          }), transition: Transition.fade);
    });
  }
}


