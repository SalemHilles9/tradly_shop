import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tradly_shope/presentation/view/auth/login_screen.dart';
import '../view/buttom_nav_bar/bottom_nav_bar_view.dart';


class AuthController extends GetxController{

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  final Rx<User?> _fierbaseUser = Rx<User?>(null);

  User? get user => _fierbaseUser.value;


  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3));
    _fierbaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password) async
  {
    CollectionReference reference = FirebaseFirestore.instance.collection(
        "Users");

    Map<String, String> userdata = {
      "Name": name,
      "Email": email
    };

    await _auth.createUserWithEmailAndPassword(email: email, password: password)
        .
    then((value) {
      reference.add(userdata).then((value) => Get.offAll(BottomNavBarView()));
    }).catchError((onError) =>
        Get.snackbar("Error while creating account ", onError.message,
            backgroundColor: Colors.white.withOpacity(0.4)));


  }


  void login(String email, String password) async
  {
    final result = await _auth.signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Get.offAll(BottomNavBarView());}).
    catchError((onError) =>
        Get.snackbar("Error while login ", onError.message,
            backgroundColor: Colors.white.withOpacity(0.4)));
    return result;
  }


  void signout() async {
    await _auth.signOut().then((value) => Get.offAll(LoginScreen()));
  }

  // Future<UserCredential> signInWithEmailAndPassword(
  //     String email, String password) async {
  //   final result = await _auth.signInWithEmailAndPassword(
  //       email: email, password: password);
  //   _fierbaseUser.value = result.user!;
  //   return result;
  // }
  //
  // Future<UserCredential> createUserWithEmailAndPassword(
  //     String email, String password) async {
  //   final result = await _auth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   _fierbaseUser.value = result.user!;
  //   return result;
  // }
  //
  // Future<void> signOut() async {
  //   await _auth.signOut();
  //   _fierbaseUser.value = Get.offAll(LoginScreen()) as User;
  // }

}