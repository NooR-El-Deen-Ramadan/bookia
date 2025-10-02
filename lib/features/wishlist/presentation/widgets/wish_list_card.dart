import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/home/data/models/books_response/product.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WishListCard extends StatelessWidget {
  const WishListCard({
    super.key,
    required this.cubit,
    required this.product,
    required this.onRefresh,
    required this.onDelete,
  });
  final Product product;
  final WishlistCubit cubit;
  final Function() onRefresh;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: product.image ?? "",
              width: 100,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),

          Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        product.name ?? "",
                        style: AppFontStyles.getSize18(
                          fontColor: AppColors.darkColor,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        cubit.removeFromWishlist(bookId: product.id ?? 0);
                      },
                      icon: SvgPicture.asset(AppIcons.deleteIconSvg),
                    ),
                  ],
                ),
                Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${product.price}"
                        " \$",
                        style: AppFontStyles.getSize18(
                          fontColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    IconButton(
                      color: AppColors.primaryColor,
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      onPressed: () {
                        pushWithoutReplacment(
                          context: context,
                          route: AppRouter.bookDetails,
                          extra: {
                            "data": product, // Product object
                            "source": "wishlist", // source identifier
                          },
                        ).then((value){
                          onRefresh();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
