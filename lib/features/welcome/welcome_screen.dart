import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/images.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.splashScreenPng,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            bottom: 110,
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.appLogoSvg, width: 250),
                Gap(30),
                Text(
                  "Order Your Book Now!",
                  style: AppFontStyles.getSize18(fontSize: 20),
                ),
                Spacer(),
                MainButton(
                  height: 60,
                  buttonText: "Login",
                  onPressed: () {
                    pushWithoutReplacment(
                      context: context,
                      route: AppRouter.login,
                    );
                  },
                ),
                Gap(15),
                MainButton(
                  borderColor: AppColors.darkColor,
                  textColor: AppColors.darkColor,
                  buttomColor: AppColors.whiteColor,
                  height: 60,
                  buttonText: "Register",
                  onPressed: () {
                    pushWithoutReplacment(
                      context: context,
                      route: AppRouter.register,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
