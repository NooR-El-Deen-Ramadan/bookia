import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/constants/icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/functions/show_dialoges.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/authentication/presentation/cubit/auth_states.dart';
import 'package:bookia/features/authentication/presentation/widgets/auth_trailer.dart';
import 'package:bookia/features/authentication/presentation/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: AuthTrailer(
          onPressed: () {},
          textButtonText: "Login",
          text: "Already have an Acoount?",
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
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            //navigate
            pushAndRemoveUntil(context: context, route: AppRouter.main);
          } else if (state is AuthError) {
            //show error
            showDialoges(context: context, message: state.error);
          } else {
            //show loading
            showLoadingDialog(context: context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegisterBody(cubit: cubit),

                  Gap(30),
                  MainButton(
                    height: 60,
                    buttonText: "Register",
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.register();
                      }
                    },
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
