import 'package:auto_pappa/model/featured_services.dart';
import 'package:auto_pappa/resources/constants/app_border_radius.dart';
import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:auto_pappa/resources/constants/font_styles.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllItemScreen extends StatelessWidget {
  AllItemScreen({super.key});

  List<FeaturedServices> featuredServicesList = [
    FeaturedServices(
        imagePath: ImageUrls.interiorWashing, title: 'Interior Washing'),
    FeaturedServices(imagePath: ImageUrls.detailing, title: 'Detailing'),
    FeaturedServices(
        imagePath: ImageUrls.exteriorWashing, title: 'Exterior Washing'),
    FeaturedServices(imagePath: ImageUrls.tyreWashing, title: 'Tyre Washing'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = featuredServicesList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Stack(
            children: [
              Container(
                height: size.height / 7,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.cardLightColor,
                    borderRadius: AppBorderRadius.gRadius10),
                child: Row(
                  children: [
                    PhysicalModel(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      child: Image.asset(
                        item.imagePath,
                        width: size.height / 5.8,
                        height: size.height / 7,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ismail vk', style: AppFontStyle.normalBold),
                          Text('Toyota Innova', style: AppFontStyle.normalBold),
                          Text('+91 5789876569',
                              style: AppFontStyle.normalBold),
                          Text('₹ 200', style: AppFontStyle.normalBoldRed)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: size.height / 28,
                  width: size.width / 3.5,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topLeft: AppBorderRadius.radius10,
                        bottomRight: AppBorderRadius.radius10),
                  ),
                  child: Center(
                      child: Text('Credit', style: AppFontStyle.normalBold)),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
