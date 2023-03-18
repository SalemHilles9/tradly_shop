import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tradly_shope/core/constances.dart';
import 'package:tradly_shope/presentation/view/auth/login_screen.dart';
import 'package:tradly_shope/presentation/view/custom_widgets/custom_button_auth.dart';

import '../../controller/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MainColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 170),
          child: Column(
            children: [
              Text(
                'Welcom to tradly',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: _mediaQuery.height * 0.085,
              ),
              Text(
                'Signup to your account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: _mediaQuery.height * 0.06,
              ),
              Form(
                key: authController.formKey2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: authController.nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid Name';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined,
                            color: Colors.white),
                        label: Text('Name'),
                        labelStyle: TextStyle(color: Colors.grey.shade400),
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height * 0.01,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: authController.emailController,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid Email address';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.email_outlined, color: Colors.white),
                        label: Text('EMAIL'),
                        labelStyle: TextStyle(color: Colors.grey.shade400),
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height * 0.01,
                    ),
                    TextFormField(
                      controller: authController.passwordController,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.lock_outlined, color: Colors.white),
                        label: Text('Password'),
                        labelStyle: TextStyle(color: Colors.grey.shade400),
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height * 0.055,
                    ),
                    CustomButtonAuth(
                      onPressed: () {
                        final isValidForm =
                            authController.formKey2.currentState!.validate();
                        if (isValidForm) {
                          authController.createUser(
                              authController.nameController.text,
                              authController.emailController.text,
                              authController.passwordController.text);
                        }
                      },
                      buttonText: 'Create',
                    ),
                    SizedBox(
                      height: _mediaQuery.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Get.to(LoginScreen());
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
