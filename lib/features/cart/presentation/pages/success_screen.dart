import 'package:bookia/core/components/buttons/main_button.dart';
import 'package:bookia/core/constants/images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SvgPicture.asset(AppImages.successMarkSvg, width: 200, height: 200),
            Gap(20),
            Text(
              "Oreder Placed Successfully",
              style: AppFontStyles.getSize30(fontWeight: FontWeight.w500),
            ),
            Gap(10),
            Text(
              textAlign: TextAlign.center,
              'Your order will be delivered soon.Thank you for choosing our app!',
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.w400,
                fontColor: AppColors.darkGreyColor,
              ),
            ),
            Gap(40),
            MainButton(
              buttonText: "Back to Login",
              onPressed: () {
                pushAndRemoveUntil(context: context, route: AppRouter.success);
              },
            ),
          ],
        ),
      ),
    );
  }
}
