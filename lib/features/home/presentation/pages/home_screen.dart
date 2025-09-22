import 'package:bookia/core/constants/images.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_states.dart';
import 'package:bookia/features/home/presentation/widgets/all_books_builder.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller_builder.dart';
import 'package:bookia/features/home/presentation/widgets/home_carousel_slider.dart';
import 'package:bookia/features/home/presentation/widgets/new_arrivals_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: SvgPicture.asset(AppImages.appLogoSvg, width: 120),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30)),
            SizedBox(width: 10),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            if (state is HomeLoadingState || state is HomeErrorState) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeCarouselSlider(sliders: cubit.sliders),
                    Gap(20),
                    BestSellerBuilder(bestSellers: cubit.bestSellers),
                    Gap(20),
                    NewArrivalsBuilder(newArrivals: cubit.newArrivals),
                    Gap(20),
                    AllBooksBuilder(allProducts: cubit.allProducts),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
