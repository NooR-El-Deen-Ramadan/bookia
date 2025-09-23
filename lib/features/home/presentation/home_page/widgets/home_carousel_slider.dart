import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/features/home/data/models/slider_response/slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key, required this.sliders});
  final List<SliderModel> sliders;
  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: CarouselSliderController(),
          itemCount: widget.sliders.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: widget.sliders[itemIndex].image ?? "",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),

          options: CarouselOptions(
            height: 150,
            viewportFraction: 1,
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            enlargeCenterPage: true,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        Gap(15),
        SmoothPageIndicator(
          controller: PageController(
            initialPage: activeIndex,
          ), // PageController
          count: widget.sliders.length,
          effect: ExpandingDotsEffect(
            dotColor: AppColors.greyColor,
            activeDotColor: AppColors.primaryColor,
            dotHeight: 8,
            radius: 15,
            dotWidth: 8,
            expansionFactor: 5,
          ), // your preferred effect
          onDotClicked: (index) {},
        ),
      ],
    );
  }
}
