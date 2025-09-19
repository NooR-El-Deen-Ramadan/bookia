import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/main_text_form_field.dart';
import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/constants/images.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/authentication/presentation/widgets/account_card.dart';
import 'package:bookia/features/authentication/presentation/widgets/auth_trailer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: AuthTrailer(
          onPressed: () {
            pushWithReplacment(context: context, route: AppRouter.register);
          },
          text: "Don't have an acoount",
          textButtonText: "Register Now",
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
              Text(
                "Welcome Back! Glad \n To See You, Again!",
                style: AppFontStyles.getSize30(),
              ),
              Gap(35),
              MainTextFormField(
                textFormFieldText: "Enter Your Email",
                controller: emailController,
                ispassword: false,
              ),
              Gap(20),
              //add visibilty icon
              MainTextFormField(
                textFormFieldText: "Enter Your Password",
                controller: passwordController,
                ispassword: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      pushWithoutReplacment(
                        context: context,
                        route: AppRouter.forgetPassword,
                      );
                    },
                    child: Text(
                      "Forget password?",
                      style: AppFontStyles.getSize18(fontSize: 16),
                    ),
                  ),
                ],
              ),
              Gap(30),
              MainButton(
                height: 60,
                buttonText: "Login",
                onPressed: () {
                  pushWithReplacment(context: context, route: AppRouter.main);
                },
              ),
              Gap(30),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Or login with",
                      style: AppFontStyles.getSize18(fontSize: 16),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              Gap(30),
              accountsButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Row accountsButtons() {
    return Row(
      spacing: 8,
      children: [
        AccountCard(cardImagePath: AppImages.googleIconSvg, onTap: () {}),

        AccountCard(cardImagePath: AppImages.appleLogoSvg, onTap: () {}),

        AccountCard(cardImagePath: AppImages.facebookIconSvg, onTap: () {}),
      ],
    );
  }
}
