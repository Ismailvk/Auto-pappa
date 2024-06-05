import 'package:auto_pappa/model/featured_services.dart';
import 'package:auto_pappa/resources/components/app_bar_button_widget.dart';
import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class VehicleDetailsScreen extends StatelessWidget {
  VehicleDetailsScreen({super.key});

  List<FeaturedServices> featuredServicesList = [
    FeaturedServices(
        imagePath: ImageUrls.interiorWashing, title: 'Interior Washing'),
    FeaturedServices(imagePath: ImageUrls.detailing, title: 'Detailing'),
    FeaturedServices(
        imagePath: ImageUrls.exteriorWashing, title: 'Exterior Washing'),
    FeaturedServices(imagePath: ImageUrls.tyreWashing, title: 'Body Washing'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: appBarWidget(context),
        title: const Text('Vehicle Details'),
        centerTitle: true,
        actions: const [
          Padding(padding: EdgeInsets.all(10), child: Icon(Icons.more_vert))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CarouselSlider(
          items: featuredServicesList
              .map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(e.imagePath),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            aspectRatio: 16 / 10,
            viewportFraction: 0.98,
            enableInfiniteScroll: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
          ),
        ),
      ),
    );
  }
}
