import 'package:bookia/core/components/app_bar/main_app_bar.dart';
import 'package:bookia/core/components/buttons/main_button.dart';
import 'package:bookia/core/components/inputs/main_text_form_field.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:flutter/material.dart' hide Size;
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
      appBar: MainAppBar(),
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
