import 'package:flutter/material.dart';

Widget notificationIcon = const Padding(
  padding: EdgeInsets.symmetric(horizontal: 15),
  child: Stack(
    children: [
      Icon(Icons.notifications),
      Positioned(
        right: 0,
        top: 1,
        child: Icon(
          Icons.radio_button_checked,
          size: 11,
          color: Colors.red,
        ),
      )
    ],
  ),
);
