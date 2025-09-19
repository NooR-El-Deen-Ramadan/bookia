import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.cardImagePath,
    required this.onTap,
  });
  final String cardImagePath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: AppColors.greyColor.withValues(alpha: 0.3),
            ),

            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(child: SvgPicture.asset(cardImagePath)),
        ),
      ),
    );
  }
}
