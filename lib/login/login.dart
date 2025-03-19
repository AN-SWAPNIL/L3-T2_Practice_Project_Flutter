import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LoginController.dart';
import 'registration.dart';
import 'forgotPass.dart';
import '../homepage/homepage.dart';

class login extends StatelessWidget {
  final LoginController c = Get.put(LoginController());

  // Add a boolean to manage password visibility
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            image: AssetImage('assets/bg3.jpeg'),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.15),
                  Colors.black.withOpacity(0.5),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        controller: c.email,
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          labelText: 'Email Address',
                          fillColor: Color(0xffD8D8DD),
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Obx(() => TextField(
                        controller: c.password,
                        obscureText: c.obscureText.value,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              c.obscureText.value ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              c.obscureText.value = !c.obscureText.value; // Toggle the visibility
                            },
                          ),
                          fillColor: Color(0xffD8D8DD),
                          filled: true,
                        ),
                      )),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 19, top: 8, right: 19),
                      child: Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(ForgotPasswordPage());
                            },
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () async {
                        bool success = await c.loginUser();
                        if (success) {
                          Get.to(homepage());
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFFFFFF),
                        padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    /*Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '-----------',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            'Or Login With',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '-----------',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                    ),*/
                   /* Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            c.loginWithGoogle();
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xff484848),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.g_mobiledata,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //c.loginWithApple();
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xff484848),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.apple,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //c.loginWithFacebook();
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xff484848),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.facebook,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),*/
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0, top: 30),
                      child: Row(
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(registration());
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
