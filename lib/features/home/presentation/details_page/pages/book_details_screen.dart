import 'package:bookia/core/components/app_bar/main_app_bar.dart';
import 'package:bookia/core/components/buttons/main_button.dart';
import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/home/data/models/books_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({
    super.key,
    required this.product,
    required this.source,
  });
  final Product product;
  final String source;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>HomeCubit(),
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "\$ ${product.price}",
                    style: AppFontStyles.getSize24(
                      fontWeight: FontWeight.w500,
      
                      fontColor: AppColors.darkColor,
                    ),
                  ),
                ),
      
                Expanded(
                  child: MainButton(
                    borderRadius: 8,
      
                    height: 50,
                    buttonText: "Add To Cart",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: MainAppBar(
          actionWidget: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppIcons.bookmarkIconSvg),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Hero(
                    tag: "${product.id}-$source",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: product.image ?? " ",
                        width: 280,
                      ),
                    ),
                  ),
                  Gap(10),
                  Text(
                    product.name ?? '',
                    style: AppFontStyles.getSize24(
                      fontWeight: FontWeight.w500,
                      fontColor: AppColors.darkColor,
                    ),
                  ),
                  Gap(10),
                  Text(
                    product.category ?? '',
                    style: AppFontStyles.getSize18(
                      fontColor: AppColors.primaryColor,
                    ),
                  ),
                  Gap(20),
                  Text(
                    product.description ?? '',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
