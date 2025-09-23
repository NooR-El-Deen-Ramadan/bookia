import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/home/data/models/books_response/product.dart';
import 'package:bookia/features/home/presentation/home_page/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllBooksBuilder extends StatelessWidget {
  const AllBooksBuilder({super.key, required this.allProducts });
  final List<Product> allProducts;
  final String source="allBooks";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "All Books",
          style: AppFontStyles.getSize24(fontWeight: FontWeight.w500),
        ),
        Gap(10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,

            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 280,
          ),
          itemCount: 10,

          itemBuilder: (BuildContext context, int index) {
            return BookCard(product: allProducts[index], source: source);
          },
        ),
      ],
    );
  }
}
