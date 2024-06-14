import 'package:auto_pappa/model/featured_services.dart';
import 'package:auto_pappa/resources/components/app_bar_button_widget.dart';
import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsAppBar extends StatefulWidget {
  const DetailsAppBar({super.key});

  @override
  State<DetailsAppBar> createState() => _DetailsAppBarState();
}

class _DetailsAppBarState extends State<DetailsAppBar> {
  final List<FeaturedServices> featuredServicesList = [
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
    return SliverAppBar(
      expandedHeight: 275,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        background: CarouselSlider(
          items: featuredServicesList
              .map((e) => Image(
                    image: AssetImage(e.imagePath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ))
              .toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
            aspectRatio: 16 / 12,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          ),
          child: Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(100)),
          ),
        ),
      ),
      leading: appBarWidget(context),
    );
  }
}
