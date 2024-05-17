import 'package:flutter/material.dart';

class FeaturedServiceWid extends StatelessWidget {
  final String imagePath;
  final String title;
  const FeaturedServiceWid(
      {super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          Text(title, style: const TextStyle(fontSize: 10))
        ],
      ),
    );
  }
}
