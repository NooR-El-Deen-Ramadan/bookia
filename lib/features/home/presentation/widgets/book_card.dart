import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/home/data/models/books_response/product.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image ?? " ",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                product.name ?? '',
                style: AppFontStyles.getSize18(
                  fontWeight: FontWeight.w500,
                  fontColor: AppColors.darkColor,
                ),
              ),
            ),
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
        ),
      ),
    );
  }
}
