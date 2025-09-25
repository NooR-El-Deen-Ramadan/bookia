import 'package:bookia/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/authentication/presentation/pages/forget_password/create_new_password_screen.dart';
import 'package:bookia/features/authentication/presentation/pages/forget_password/forget_password_screen.dart';
import 'package:bookia/features/authentication/presentation/pages/forget_password/otp_screen.dart';
import 'package:bookia/features/authentication/presentation/pages/forget_password/password_reset_success_screen.dart';
import 'package:bookia/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:bookia/features/authentication/presentation/pages/register/register_screen.dart';
import 'package:bookia/features/home/data/models/books_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/details_page/pages/book_details_screen.dart';
import 'package:bookia/features/main/presentation/pages/main_screen.dart';
import 'package:bookia/features/splash/splash_screen.dart';
import 'package:bookia/features/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String splash = "/";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgetPassword = "/forgetPassword";
  static const String otp = "/otp";
  static const String changePassword = "/changePassword";
  static const String passwordResetSuccess = "/passwordResetSuccess";
  static const String main = "/main";
  static const String bookDetails = "/bookDetails";

  static final routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(path: otp, builder: (context, state) => OtpScreen()),
      GoRoute(
        path: changePassword,
        builder: (context, state) => CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: passwordResetSuccess,
        builder: (context, state) => PasswordResetSuccessScreen(),
      ),
      GoRoute(path: main, builder: (context, state) => MainScreen()),
      GoRoute(
        path: bookDetails,
        builder: (context, state) {
          var args = state.extra as Map<String, dynamic>;
          return BlocProvider(
            create: (context) => HomeCubit(),
            child: BookDetailsScreen(
              product: args["data"] as Product,
              source: args["source"] as String,
            ),
          );
        },
      ),
    ],
  );
}
