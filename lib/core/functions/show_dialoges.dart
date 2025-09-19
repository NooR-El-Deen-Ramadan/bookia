import 'package:bookia/core/constants/animation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showDialoges({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
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
