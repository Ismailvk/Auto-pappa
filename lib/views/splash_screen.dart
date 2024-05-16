// ignore_for_file: use_build_context_synchronously

import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:auto_pappa/views/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    loginCheck(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(ImageUrls.appLogo),
      ),
    );
  }

  loginCheck(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
}
