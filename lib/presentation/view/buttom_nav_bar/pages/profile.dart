import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradly_shope/presentation/controller/auth_controller.dart';
import 'package:tradly_shope/presentation/view/custom_widgets/custom_app_bar.dart';

import '../../../../core/constances.dart';

class ProfileScreen extends GetWidget<AuthController> {
  AuthController authController = AuthController();
  final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    final Stream<QuerySnapshot> users = FirebaseFirestore.instance
        .collection("Users")
        .where('Email', isEqualTo: currentUser.currentUser!.email)
        .snapshots();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          text: 'Profile',
        ),
        body: SafeArea(
          child: Scaffold(
            backgroundColor: BackgroundColor,
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: MainColor,
                      width: double.infinity,
                      height: _mediaQuery.height * .35,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50.0,
                          backgroundImage: AssetImage(
                            'assets/images/profile.jpg',
                          ),
                        ),
                        SizedBox(
                          height: _mediaQuery.height * 0.015,
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream: users,
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Somthing went wrong.');
                              }
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }
                              final data = snapshot.requireData;
                              return Container(
                                height: _mediaQuery.height * 0.08,
                                child: ListView.builder(
                                  itemCount: data.size,
                                  itemBuilder: (context, index) {
                                    return Column(
                                        children: [
                                          Text(
                                            '${data.docs[index]['Name']}',
                                    style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: _mediaQuery.height * 0.005,
                                          ),
                                          Text(
                                            '${data.docs[index]['Email']}',
                                    style: TextStyle(color: Colors.grey[100],fontSize: 14,),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      );
                                  },
                                ),
                              );
                            }),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 190, left: 25, right: 25),
                  child: Column(
                    children: [
                      Container(
                        width: _mediaQuery.width * 1,
                        height: _mediaQuery.height * .36,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Edit profile',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Language & Currency',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Feedback',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Refer a Friend',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Terms & Conditions',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                        title: 'Are you sure?',
                                        content: Text('Do you want to logout'),
                                        actions: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.grey[100]),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              'No',
                                              style:
                                                  TextStyle(color: MainColor),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: MainColor),
                                            onPressed: () {
                                              authController.signout();
                                            },
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ]);
                                  },
                                  child: Text('Logout')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),);
}
}

