import 'package:auto_pappa/model/featured_services.dart';
import 'package:auto_pappa/resources/components/appbar_notification_icon_widget.dart';
import 'package:auto_pappa/resources/components/search_filter.dart';
import 'package:auto_pappa/resources/components/search_textfield.dart';
import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:auto_pappa/views/add_item_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

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
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Auto Pappa",
          style: TextStyle(
            color: AppColors.primaryColor.withOpacity(0.5),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [notificationIcon],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('A clean car is a \nhappy car',
                style: TextStyle(
                    fontSize: size.width / 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    flex: 5,
                    child: SearchTextFeildWidget(
                        notEditableCheck: false, controller: searchController)),
                const SizedBox(width: 12),
                const Expanded(flex: 1, child: FilterWidget())
              ],
            ),
            const SizedBox(height: 10),
            const Text('Featured Services',
                style: TextStyle(color: AppColors.lightGrey)),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: featuredServicesList.length,
                itemBuilder: (context, index) {
                  final item = featuredServicesList[index];
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(item.imagePath),
                        ),
                        Text(item.title, style: const TextStyle(fontSize: 10))
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddItemScreen()));
          },
          label: const Icon(Icons.add)),
    );
  }
}