import 'package:bookia/core/components/buttons/main_button.dart';
import 'package:bookia/core/constants/animation.dart';
import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishlist(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Wishlist",
            style: AppFontStyles.getSize24(fontColor: AppColors.darkColor),
          ),
        ),
        body: BlocBuilder<WishlistCubit, WishlistStates>(
          builder: (context, state) {
            var cubit = context.read<WishlistCubit>();
            if (state is! WishlistSuccessState &&
                state is! EmptyWishlistState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is EmptyWishlistState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                    Text(
                      "No Items In Wishlist",
                      style: AppFontStyles.getSize24(),
                    ),

                    Gap(30),
                    Lottie.asset(
                      AppAnimation.emptyWishlistAnimation,
                      height: 250,
                      repeat: true,
                    ),
                    Gap(50),
                    Text(
                      "Try Adding Some Books!",
                      style: AppFontStyles.getSize24(),
                    ),
                  ],
                ),
              );
            }
            return ListView.separated(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: cubit.wishlistItems[index].image ?? "",
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
                                  cubit.wishlistItems[index].name ?? "",
                                  style: AppFontStyles.getSize18(
                                    fontColor: AppColors.darkColor,
                                  ),
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  cubit.removeFromWishlist(
                                    bookId: cubit.wishlistItems[index].id ?? 0,
                                  );
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
                                  "${cubit.wishlistItems[index].price}"
                                  " \$",
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
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: cubit.wishlistItems.length,
            );
          },
        ),
      ),
    );
  }
}
