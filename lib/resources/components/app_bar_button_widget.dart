import 'package:flutter/material.dart';

Widget appBarWidget(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        height: 40,
        width: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Center(
            child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context)),
          ),
        ),
      ),
    );
