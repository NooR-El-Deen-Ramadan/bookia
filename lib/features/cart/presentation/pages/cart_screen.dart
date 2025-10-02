import 'package:bookia/core/components/buttons/main_button.dart';
import 'package:bookia/core/constants/animation.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_states.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<CartCubit, CartStates>(
          builder: (context, state) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Total",
                        style: AppFontStyles.getSize18(
                          fontColor: AppColors.darkColor,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$ ${context.read<CartCubit>().cartResponse?.data?.total}",
                        style: AppFontStyles.getSize18(
                          fontColor: AppColors.darkColor,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  MainButton(
                    buttonText: "Checkout",
                    onPressed: () {
                      pushWithoutReplacment(
                        context: context,
                        extra: context
                            .read<CartCubit>()
                            .cartResponse
                            ?.data
                            ?.total,
                        route: AppRouter.placeOrder,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Cart",
            style: AppFontStyles.getSize24(fontColor: AppColors.darkColor),
          ),
        ),
        body: BlocBuilder<CartCubit, CartStates>(
          builder: (context, state) {
            var cubit = context.read<CartCubit>();
            var books = cubit.cartResponse?.data?.cartItems ?? [];
            if (state is! CartSuccessState) {
              return Center(child: CircularProgressIndicator());
            }
            if (books.isEmpty == true) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Items In Cart", style: AppFontStyles.getSize24()),

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
              itemBuilder: (context, index) => CartCard(
                onUpdate: (newQuantity) {
                  cubit.updateCart(
                    cartItemId: books[index].itemId ?? 0,
                    quantity: newQuantity,
                  );
                },
                onDelete: () {
                  cubit.removeFromCart(cartItemId: books[index].itemId ?? 0);
                },
                product: books[index],
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: books.length,
            );
          },
        ),
      ),
    );
  }
}
