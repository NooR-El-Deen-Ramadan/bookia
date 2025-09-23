import 'package:bookia/core/components/buttons/main_button.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/home/data/models/books_response/product.dart';
import 'package:bookia/features/home/presentation/home_page/widgets/card_trailing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product, required this.source});
  final Product product;
  final String source;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushWithoutReplacment(
          context: context,
          route: AppRouter.bookDetails,
          extra: {"data": product, "source": source},
        );
      },
      child: Container(
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
                child: Hero(
                  tag: "${product.id}-$source",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: product.image ?? " ",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
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
              CardTrailing(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
