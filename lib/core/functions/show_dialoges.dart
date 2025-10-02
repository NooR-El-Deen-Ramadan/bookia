import 'package:bookia/core/constants/animation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum DialogTypes { error, success }

void showDialoges({
  required BuildContext context,
  required String message,
  DialogTypes type = DialogTypes.error,
}) {
  Color backgroundColor;

  switch (type) {
    case DialogTypes.success:
      backgroundColor = AppColors.primaryColor;
      break;
    case DialogTypes.error:
      backgroundColor = Colors.red;
      break;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      margin: EdgeInsets.all(20),
      content: Text(message),
    ),
  );
}

void showLoadingDialog({required BuildContext context}) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return Center(child: Lottie.asset(AppAnimation.bookLoadingAnimation));
    },
  );
}
