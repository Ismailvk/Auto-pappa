import 'package:auto_pappa/model/featured_services.dart';
import 'package:auto_pappa/resources/components/vehicle_card.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:auto_pappa/views/vehicle_deails_screen.dart';
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
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        FeaturedServices item = featuredServicesList[index];
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => VehicleDetailsScreen()));
            },
            child: VehicleCard(featuredService: item));
      },
    );
  }
}
