import 'package:bookia/core/components/inputs/main_text_form_field.dart';
import 'package:bookia/core/functions/app_regex.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key, required this.cubit});

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hello! Register to get \nstarted",
          style: AppFontStyles.getSize30(),
        ),
        Gap(35),
        MainTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please, enter a valid username";
            } else {
              return null;
            }
          },
          textFormFieldText: "Username",
          controller: cubit.userNameController,
          ispassword: false,
        ),
        Gap(20),

        MainTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please, enter a valid email";
            } else if (!AppRegex.isEmailValid(cubit.emailController.text)) {
              return "Please, enter a valid email";
            } else {
              return null;
            }
          },
          textFormFieldText: "Email",
          controller: cubit.emailController,
          ispassword: false,
        ),
        Gap(20),
        MainTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please, enter a valid Password";
            } else if (value.length < 6) {
              return "Password must be at least 6 characters";
            } else {
              return null;
            }
          },
          textFormFieldText: "Password",
          controller: cubit.passweordController,
          ispassword: true,
        ),
        Gap(20),
        MainTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please, enter the same Password";
            } else if (value.length < 6) {
              return "Password must be at least 6 characters";
            } else {
              return null;
            }
          },
          textFormFieldText: "Confirm Password",
          controller: cubit.passwordConfirmationController,
          ispassword: true,
        ),
      ],
    );
  }
}
