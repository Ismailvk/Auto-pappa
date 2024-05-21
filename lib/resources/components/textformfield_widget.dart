import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  TextInputType? number;
  final FormFieldValidator<String?>? validator;
  double? width;

  MyTextField({
    super.key,
    this.number,
    this.width,
    required this.validator,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: width ?? double.infinity,
        minWidth: 100,
      ),
      child: TextFormField(
        validator: validator,
        keyboardType: number ?? TextInputType.text,
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 5, color: Colors.red)),
            label: Text(hintText, style: const TextStyle(color: Colors.black)),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorStyle: const TextStyle(fontSize: 8),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
