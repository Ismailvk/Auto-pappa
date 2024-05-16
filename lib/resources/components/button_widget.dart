import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onPress;
  final double? width;

  const ButtonWidget(
      {super.key, required this.title, this.onPress, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: width ?? MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor)),
        child: Text(title,
            style: const TextStyle(color: AppColors.secondaryColor)),
      ),
    );
  }
}
