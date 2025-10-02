import 'package:bookia/core/constants/animation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wish_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              itemBuilder: (context, index) => WishListCard(
                cubit: cubit,
                product: cubit.wishlistItems[index],
                onRefresh: cubit.getWishlist,
                onDelete: () {
                  cubit.removeFromWishlist( bookId: cubit.wishlistItems[index].id ?? 0);
                },
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
