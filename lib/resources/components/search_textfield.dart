import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchTextFeildWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  SearchTextFeildWidget(
      {super.key,
      required this.controller,
      this.notEditableCheck = true,
      this.onChanged});
  bool notEditableCheck;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height / 17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.grey.shade200,
      ),
      child: TextField(
        enabled: notEditableCheck ? false : true,
        controller: controller,
        onChanged: onChanged,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search_rounded,
              color: AppColors.lightGrey,
            ),
            hintText: 'Search Vehicle',
            hintStyle: TextStyle(color: AppColors.lightGrey),
            contentPadding: EdgeInsets.only(top: 15),
            border: InputBorder.none),
      ),
    );
  }
}
