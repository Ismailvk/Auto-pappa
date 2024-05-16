import 'package:auto_pappa/resources/components/button_widget.dart';
import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:auto_pappa/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  String otp = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(ImageUrls.otpImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                AppColors.secondaryColor.withOpacity(0.7), BlendMode.darken),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Verify Your Otp',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: size.height / 20),
            OtpTextField(
              numberOfFields: 5,
              borderColor: AppColors.secondaryColor,
              focusedBorderColor: AppColors.primaryColor,
              showFieldAsBox: true,
              borderWidth: 4.0,
              textStyle: const TextStyle(color: AppColors.white),
              onSubmit: (String verificationCode) => otp = verificationCode,
            ),
            SizedBox(height: size.height / 20),
            ButtonWidget(
              title: 'Verify Otp',
              onPress: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false),
            )
          ],
        ),
      ),
    );
  }
}
