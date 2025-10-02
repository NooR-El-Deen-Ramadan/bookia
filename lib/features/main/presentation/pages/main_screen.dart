import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/features/cart/presentation/pages/cart_screen.dart';
import 'package:bookia/features/home/presentation/home_page/pages/home_screen.dart';
import 'package:bookia/features/wishlist/presentation/pages/whishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttomNavBuilder(),
      body: screens[currentIndex],
    );
  }

  BottomNavigationBar buttomNavBuilder() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            AppIcons.homeIconSvg,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          icon: SvgPicture.asset(AppIcons.homeIconSvg),
          label: "Home",
        ),

        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            AppIcons.bookmarkIconSvg,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          icon: SvgPicture.asset(AppIcons.bookmarkIconSvg),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            AppIcons.categoryIconSvg,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          icon: SvgPicture.asset(AppIcons.categoryIconSvg),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            AppIcons.profileIconSvg,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          icon: SvgPicture.asset(AppIcons.profileIconSvg),
          label: "Profile",
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
