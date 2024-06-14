import 'package:auto_pappa/model/featured_services.dart';
import 'package:auto_pappa/resources/components/app_bar_button_widget.dart';
import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:auto_pappa/resources/constants/font_styles.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(featuredServicesList[0].imagePath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 220,
                  ),
                ),
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Toyota Innova',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(width: 8),
                        const Text('• 19-Mar-2024',
                            style: TextStyle(
                                color: AppColors.lightGrey, fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.check_circle,
                            color: Colors.green.shade200, size: 20),
                        const SizedBox(width: 5),
                        const Text('Body Washing'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('User Details', style: AppFontStyle.normalBold),
                    Container(
                      color: Colors.yellow.shade100,
                      child: const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Muhammed Haris'),
                        subtitle: Text('+91 7034443499'),
                        trailing: CircleAvatar(
                            backgroundColor: AppColors.lightGrey,
                            child: Icon(Icons.call_outlined)),
                      ),
                    ),
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
                          viewportFraction: 0.8,
                          enableInfiniteScroll: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Grand Total', style: AppFontStyle.font18Bold),
                    Container(
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text('₹ 200',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    )
                  ],
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
