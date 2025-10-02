import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/functions/show_dialoges.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    this.product,
    required this.onDelete,
    required this.onUpdate,
  });

  final CartItem? product;
  final Function() onDelete;
  final Function(int quantity) onUpdate;

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
                    GestureDetector(
                      onTap: () {
                        if ((product?.itemQuantity ?? 1) <
                            (product?.itemProductStock ?? 1)) {
                          onUpdate(product?.itemQuantity ?? 1 + 1);
                        } else {
                          showDialoges(
                            context: context,
                            message:
                                "Maximaum quantitity is ${product?.itemProductStock ?? 1}",
                            type: DialogTypes.warning,
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.greyColor.withValues(alpha: 0.2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(Icons.add, color: AppColors.darkColor),
                        ),
                      ),
                    ),
                    Gap(10),
                    SizedBox(
                      width: 20,
                      child: Text(
                        "${product?.itemQuantity ?? 0}",
                        style: AppFontStyles.getSize18(
                          fontColor: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Gap(10),
                    GestureDetector(
                      onTap: () {
                        if ((product?.itemQuantity ?? 1) > 1) {
                          onUpdate(product?.itemQuantity ?? 1 - 1);
                        } else {
                          showDialoges(
                            type: DialogTypes.warning,
                            context: context,
                            message: "Quantity can't be less than 1",
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.greyColor.withValues(alpha: 0.2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(Icons.remove, color: AppColors.darkColor),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Total: ${((product?.itemProductPriceAfterDiscount ?? 0) * (product?.itemQuantity ?? 0)).toStringAsFixed(2)} \$",
                      style: AppFontStyles.getSize18(
                        fontColor: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
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
