// ignore_for_file: unnecessary_string_escapes

import 'package:auto_pappa/resources/components/button_widget.dart';
import 'package:auto_pappa/resources/components/textformfield_widget.dart';
import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:auto_pappa/views/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(ImageUrls.loginImage),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.darken,
              ),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: size.height / 8),
              child: Container(
                height: size.height / 2.2,
                width: size.width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: loginKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Login Your Account',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          validator: (value) => null,
                          controller: emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 8),
                        MyTextField(
                          validator: (value) => null,
                          controller: emailController,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 8),
                        ButtonWidget(title: 'Login', isLoading: false),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Expanded(child: Divider(thickness: 1)),
                              SizedBox(width: 8),
                              Text('OR',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 8),
                              Expanded(child: Divider(thickness: 1)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Don\'t have an account? ",
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Sign up',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 17),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen()));
                                  },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
