import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:bookia/features/authentication/presentation/widgets/auth_trailer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: AuthTrailer(
          onPressed: () {},
          text: "Didn't recieve Code?",
          textButtonText: "resend",
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
              Text("OTP Verification", style: AppFontStyles.getSize30()),
              Gap(10),
              Text(
                "Enter the verification code we just sent on your email address.",
                style: AppFontStyles.getSize18(
                  fontSize: 16,
                  fontColor: AppColors.darkGreyColor,
                ),
              ),
              Gap(30),

              //add Otp cards

              // MainTextFormField(
              //   textFormFieldText: "Enter Your Email",
              //   controller: emailController,
              //   ispassword: false,
              // ),
              Gap(30),

              //add visibilty icon
              MainButton(
                height: 60,
                buttonText: "Verify",
                onPressed: () {
                  pushWithReplacment(
                    context: context,
                    route: AppRouter.changePassword,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
