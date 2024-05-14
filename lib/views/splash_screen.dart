import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(ImageUrls.appLogo),
      ),
    );
  }
}
