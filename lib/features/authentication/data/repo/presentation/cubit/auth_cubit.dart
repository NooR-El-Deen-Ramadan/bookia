import 'package:bookia/features/authentication/data/models/request/auth_params.dart';
import 'package:bookia/features/authentication/data/repo/auth_repo.dart';
import 'package:bookia/features/authentication/presentation/cubit/auth_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();

  login() {}

  // ignore: avoid_types_as_parameter_names
  register() async {
    emit(AuthLoading());

    //regestrition Api call
    var response = await AuthRepo.register(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
        password_confirmation: passwordConfirmationController.text,
        name: userNameController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError(error: "Regestration Failed"));
    }
  }
}
