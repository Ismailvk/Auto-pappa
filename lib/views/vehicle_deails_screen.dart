import 'package:auto_pappa/model/featured_services.dart';
import 'package:auto_pappa/resources/components/app_bar_button_widget.dart';
import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({super.key});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  List<FeaturedServices> featuredServicesList = [
    FeaturedServices(
        imagePath: ImageUrls.interiorWashing, title: 'Interior Washing'),
    FeaturedServices(imagePath: ImageUrls.detailing, title: 'Detailing'),
    FeaturedServices(
        imagePath: ImageUrls.exteriorWashing, title: 'Exterior Washing'),
    FeaturedServices(imagePath: ImageUrls.tyreWashing, title: 'Body Washing'),
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
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
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                    aspectRatio: 16 / 10,
                    viewportFraction: 0.98,
                    enableInfiniteScroll: false,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: size.width / 2.5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: AnimatedSmoothIndicator(
                      effect: WormEffect(
                          activeDotColor: AppColors.primaryColor,
                          dotHeight: 7,
                          dotWidth: 7),
                      activeIndex: activeIndex,
                      count: featuredServicesList.length),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
