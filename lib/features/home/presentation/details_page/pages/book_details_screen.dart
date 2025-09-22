import 'package:bookia/core/components/app_bar/main_app_bar.dart';
import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/features/home/data/models/books_response/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.product});
final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(actionWidget:GestureDetector(
          onTap: () {
            
          },
        child: SvgPicture.asset( AppIcons.bookmarkIconSvg))),
    );
  }
}