import 'package:bookia/core/components/buttons/main_button.dart';
import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, this.product, required this.onDelete});

  final CartItem? product;
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
              imageUrl: product?.itemProductImage ?? "",
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
                        product?.itemProductName ?? "",
                        style: AppFontStyles.getSize18(
                          fontColor: AppColors.darkColor,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: onDelete,
                      icon: SvgPicture.asset(AppIcons.deleteIconSvg),
                    ),
                  ],
                ),
                Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${product?.itemProductPrice}  \$",
                        style: AppFontStyles.getSize18(
                          fontColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: MainButton(
                        borderRadius: 4,
                        buttonText: "Add To Cart",
                        onPressed: () {},
                        height: 40,
                      ),
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
