import 'package:bookia/core/components/buttons/main_button.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/home/data/models/books_response/product.dart';
import 'package:flutter/material.dart';

class CardTrailing extends StatelessWidget {
  const CardTrailing({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "\$ ${product.price}",
                style: AppFontStyles.getSize12(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontColor: AppColors.darkColor,
                ),
              ),
            ),

            MainButton(
              borderRadius: 4,
              width: 70,
              height: 30,
              buttonText: "Buy",
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
