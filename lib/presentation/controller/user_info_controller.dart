// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ProfileController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final CollectionReference _usersCollectionRef =
//   FirebaseFirestore.instance.collection('Users');
//
//   late Rx<User> _firebaseUser;
//   late Rx<UserData> _userData;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _firebaseUser = Rx<User>(_auth.currentUser!);
//     _auth.authStateChanges().listen((User? user) {
//       if (user != null) {
//         _firebaseUser.value = user;
//         _getUserData(user);
//       }
//     });
//     _userData = Rx<UserData>(UserData(name: '', email: ''));
//   }
//
//   UserData get userData => _userData.value;
//
//   void _getUserData(User user) async {
//     DocumentSnapshot userDataDoc =
//     await _usersCollectionRef.doc(user.uid).get();
//     if (userDataDoc.exists) {
//       _userData.value = UserData.fromFirestore(userDataDoc);
//     }
//   }
// }
//
//
// class UserData {
//   final String name;
//   final String email;
//
//   UserData({required this.name, required this.email});
//
//   factory UserData.fromFirestore(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     return UserData(
//       name: data['Name'],
//       email: data['Email'],
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tradly_shope/presentation/controller/auth_controller.dart';

class DataController extends GetxController {
  final firebaseInstance = FirebaseFirestore.instance;
  Map userProfileData = {'Name': '', 'Email': '',};
  AuthController authController = AuthController();

  void onReady() {
    super.onReady();
    getUserProfileData();
  }

  Future<void> getUserProfileData() async {
    try {
      var response = await firebaseInstance.collection('Users').where(
          'Name', isEqualTo: authController.nameController).get();
      if(response.docs.length > 0){
        userProfileData['Name'] = response.docs[0]['Name'];
        userProfileData['Email'] = response.docs[0]['Email'];
      }print(userProfileData);
    }on FirebaseException catch(e){
      print(e.message);
    }catch(error){
      print(error.toString());
    }
  }
}