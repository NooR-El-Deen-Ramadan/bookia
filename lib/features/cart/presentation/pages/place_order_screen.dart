import 'package:bookia/core/components/app_bar/main_app_bar.dart';
import 'package:bookia/core/components/buttons/main_button.dart';
import 'package:bookia/core/components/inputs/main_text_form_field.dart';
import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/functions/app_regex.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';

import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key, required this.totalPrice});
  final String totalPrice;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return BlocListener<CartCubit, CartStates>(
      listener: (context, state) {},
      child: Form(
        child: Scaffold(
          key: cubit.formKey,
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
                          "\$ $totalPrice",
                          style: AppFontStyles.getSize18(
                            fontColor: AppColors.darkColor,
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                    MainButton(
                      buttonText: "Place Order",
                      onPressed: () {
                        final formState = cubit.formKey.currentState;
                        if (formState != null && formState.validate()) {
                          pushAndRemoveUntil(
                            context: context,
                            route: AppRouter.success,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          appBar: MainAppBar(
            actionWidget: SvgPicture.asset(AppIcons.backIconPng),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Place your Order", style: AppFontStyles.getSize30()),
                    Gap(20),
                    Text(
                      "place your order and get it delivered to your doorstep in no time",
                      style: AppFontStyles.getSize18(
                        fontColor: AppColors.darkGreyColor,
                      ),
                    ),
                    Gap(20),
                    MainTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please, enter a valid username";
                        } else {
                          return null;
                        }
                      },
                      textFormFieldText: "Full Name",
                      controller: cubit.nameController,
                      ispassword: false,
                    ),
                    Gap(12),
                    MainTextFormField(
                      textFormFieldText: "Email",
                      validator: (vlale) {
                        if (vlale == null || vlale.isEmpty) {
                          return "Please, enter a valid email";
                        } else if (!AppRegex.isEmailValid(
                          cubit.emailController.text,
                        )) {
                          return "Please, enter a valid email";
                        } else {
                          return null;
                        }
                      },
                      controller: cubit.emailController,
                      ispassword: false,
                    ),
                    Gap(12),
                    MainTextFormField(
                      textFormFieldText: "Address",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please, enter a valid address";
                        } else {
                          return null;
                        }
                      },

                      controller: cubit.addressController,
                      ispassword: false,
                    ),
                    Gap(12),
                    MainTextFormField(
                      textFormFieldText: "Phone Number",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please, enter a valid phone number";
                        } else if (AppRegex.isPhoneValid(
                          cubit.phoneController.text,
                        )) {
                          return "Please, enter a valid phone number";
                        } else {
                          return null;
                        }
                      },
                      controller: cubit.phoneController,
                      ispassword: false,
                    ),
                    Gap(12),
                    MainTextFormField(
                      readOnly: true,
                      suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
                      textFormFieldText: "Governrate",
                      controller: cubit.governrateController,
                      ispassword: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
