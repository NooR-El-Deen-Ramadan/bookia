import 'package:bookia/core/components/buttons/main_button.dart';
import 'package:bookia/core/components/inputs/main_text_form_field.dart';
import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/authentication/presentation/widgets/auth_trailer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: AuthTrailer(
          onPressed: () {
            pushWithReplacment(context: context, route: AppRouter.register);
          },
          text: "Remember password?",
          textButtonText: "Login",
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: GestureDetector(
          onTap: () {
            pop(context);
          },
          child: Image.asset(AppIcons.backIconPng, width: 45, height: 45),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forgot Password?", style: AppFontStyles.getSize30()),
              Gap(10),
              Text(
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: AppFontStyles.getSize18(
                  fontSize: 16,
                  fontColor: AppColors.darkGreyColor,
                ),
              ),
              Gap(30),
              MainTextFormField(
                textFormFieldText: "Enter Your Email",
                controller: emailController,
                ispassword: false,
              ),
              Gap(30),

              //add visibilty icon
              MainButton(
                height: 60,
                buttonText: "Send Code",
                onPressed: () {
                  pushWithReplacment(context: context, route: AppRouter.otp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
