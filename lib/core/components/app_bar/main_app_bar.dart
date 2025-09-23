import 'dart:ui';
import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, this.actionWidget});
  final Widget? actionWidget;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      actions: [Padding(
        padding: const EdgeInsets.all(10),
        child: actionWidget ?? SizedBox(),
      )],
      title: GestureDetector(
        onTap: () {
          pop(context);
        },
        child: Image.asset(AppIcons.backIconPng, width: 45, height: 45),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
