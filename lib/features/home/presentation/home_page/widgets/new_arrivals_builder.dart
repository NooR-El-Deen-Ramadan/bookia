import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/home/data/models/books_response/product.dart';
import 'package:bookia/features/home/presentation/home_page/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewArrivalsBuilder extends StatelessWidget {
  const NewArrivalsBuilder({super.key, required this.newArrivals});
  final List<Product> newArrivals;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "New Arrivals",
              style: AppFontStyles.getSize24(fontWeight: FontWeight.w500),
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                "See All",
                style: AppFontStyles.getSize18(
                  fontSize: 16,
                  fontColor: AppColors.primaryColor,
                ),
              ),
            ),
            Gap(10),
          ],
        ),

        Gap(10),
        SizedBox(
          height: 290,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return BookCard(product: newArrivals[index]);
            },
            separatorBuilder: (context, index) {
              return Gap(10);
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
