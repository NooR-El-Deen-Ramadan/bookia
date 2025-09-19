import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/main_text_form_field.dart';
import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  TextEditingController confirmPassweordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text("Create New Password", style: AppFontStyles.getSize30()),
              Gap(10),
              Text(
                "Your new password must be unique from those previously used.",
                style: AppFontStyles.getSize18(
                  fontSize: 16,
                  fontColor: AppColors.darkGreyColor,
                ),
              ),

              Gap(35),
              MainTextFormField(
                textFormFieldText: "new Password",
                controller: newPasswordController,
                ispassword: true,
              ),
              Gap(20),
              //add visibilty icon
              MainTextFormField(
                textFormFieldText: "confirm Password",
                controller: confirmPassweordController,
                ispassword: true,
              ),

              Gap(30),
              MainButton(
                height: 60,
                buttonText: "Reset Password",
                onPressed: () {
                  pushWithReplacment(
                    context: context,
                    route: AppRouter.passwordResetSuccess,
                  );
                },
              ),
              Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
