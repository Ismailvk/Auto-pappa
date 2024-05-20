import 'package:auto_pappa/model/featured_services.dart';
import 'package:auto_pappa/resources/components/appbar_notification_icon_widget.dart';
import 'package:auto_pappa/resources/components/featured_service_widget.dart';
import 'package:auto_pappa/resources/components/search_filter.dart';
import 'package:auto_pappa/resources/components/search_textfield.dart';
import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:auto_pappa/views/add_item_screen.dart';
import 'package:auto_pappa/views/all_screen.dart';
import 'package:auto_pappa/views/cashed_screen.dart';
import 'package:auto_pappa/views/credit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();

  List<FeaturedServices> featuredServicesList = [
    FeaturedServices(
        imagePath: ImageUrls.interiorWashing, title: 'Interior Washing'),
    FeaturedServices(imagePath: ImageUrls.detailing, title: 'Detailing'),
    FeaturedServices(
        imagePath: ImageUrls.exteriorWashing, title: 'Exterior Washing'),
    FeaturedServices(imagePath: ImageUrls.tyreWashing, title: 'Body Washing'),
  ];

  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

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
            Row(
              children: [
                FeaturedServiceWid(
                    imagePath: featuredServicesList[0].imagePath,
                    title: featuredServicesList[0].title),
                FeaturedServiceWid(
                    imagePath: featuredServicesList[1].imagePath,
                    title: featuredServicesList[1].title),
                FeaturedServiceWid(
                    imagePath: featuredServicesList[2].imagePath,
                    title: featuredServicesList[2].title),
                FeaturedServiceWid(
                    imagePath: featuredServicesList[3].imagePath,
                    title: featuredServicesList[3].title)
              ],
            ),
            DefaultTabController(
              length: 3,
              child: TabBar(
                controller: tabController,
                dividerColor: AppColors.white,
                indicator: PointTabIndicator(
                  position: PointTabIndicatorPosition.bottom,
                  color: AppColors.primaryColor,
                  insets: const EdgeInsets.only(bottom: 6),
                ),
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: 'Credit'),
                  Tab(text: 'Cashed'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  AllItemScreen(),
                  const CreditScreen(),
                  const CashedScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddItemScreen()));
          },
          label: const Icon(Icons.add)),
    );
  }
}
