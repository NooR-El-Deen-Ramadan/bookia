import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthTrailer extends StatelessWidget {
  AuthTrailer({
    super.key,
    required this.onPressed,
    required this.textButtonText,
    required this.text,
  });
  void Function()? onPressed;
  final String textButtonText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppFontStyles.getSize18(fontSize: 16)),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButtonText,
            style: AppFontStyles.getSize18(
              fontSize: 16,
              fontColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
