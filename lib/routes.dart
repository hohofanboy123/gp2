import 'package:fexercise/essential/constants/route_name.dart';
import 'package:fexercise/mid_ware.dart';
import 'package:fexercise/view/screen/auth/account_created.dart';
import 'package:fexercise/view/screen/auth/pass_code_verify.dart';
import 'package:fexercise/view/screen/auth/forget_password.dart';
import 'package:fexercise/view/screen/auth/reset_password.dart';
import 'package:fexercise/view/screen/auth/sign_in.dart';
import 'package:fexercise/view/screen/auth/sign_up.dart';
import 'package:fexercise/view/screen/auth/reset_password_sucess.dart';
import 'package:fexercise/view/screen/auth/sign_up_code.dart';
import 'package:fexercise/view/screen/home.dart';
import 'package:fexercise/view/screen/language.dart';
import 'package:fexercise/view/screen/welcomescreen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/",                            page: () => const Home()),
  //GetPage(name: "/",                            page: () => const Language(),),//middlewares: [MiddleWare()],
  GetPage(name: AppRoute.welcome,               page: () => const WelcomeScreen(),),
  GetPage(name: AppRoute.signIn,                page: () => const SignIn()),
  GetPage(name: AppRoute.signUp,                page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword,        page: () => const ForgetPassword()),
  GetPage(name: AppRoute.passCodeVerify,        page: () => const VerifyOtp()),
  GetPage(name: AppRoute.resetPassword,         page: () => const ResetPassword()),
  GetPage(name: AppRoute.resetPasswordSuccess,  page: () => const Success()),
  GetPage(name: AppRoute.signUpCode,            page: () => const VerifySignUpOtp()),
  GetPage(name: AppRoute.accountCreated,        page: () => const SignUpSuccess()),
  GetPage(name: AppRoute.home,                  page: () => const Home()),

];
