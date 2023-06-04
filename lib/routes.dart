import 'package:fexercise/essential/constants/route_name.dart';
import 'package:fexercise/view/screen/auth/account_created.dart';
import 'package:fexercise/view/screen/auth/pass_code_verify.dart';
import 'package:fexercise/view/screen/auth/forget_password.dart';
import 'package:fexercise/view/screen/auth/reset_password.dart';
import 'package:fexercise/view/screen/auth/sign_in.dart';
import 'package:fexercise/view/screen/auth/sign_up.dart';
import 'package:fexercise/view/screen/auth/reset_password_sucess.dart';
import 'package:fexercise/view/screen/auth/sign_up_code.dart';
import 'package:fexercise/view/screen/bowl/bowl_list.dart';
import 'package:fexercise/view/screen/bowl/bowl_view.dart';
import 'package:fexercise/view/screen/calories/body_anthropometry.dart';
import 'package:fexercise/view/screen/calories/daily_info.dart';
import 'package:fexercise/view/screen/exercise/exercise_detail.dart';
import 'package:fexercise/view/screen/exercise/exercise_type.dart';
import 'package:fexercise/view/screen/exercise/main_exercise.dart';
import 'package:fexercise/view/screen/food/food_detail.dart';
import 'package:fexercise/view/screen/food/food_view.dart';
import 'package:fexercise/view/screen/language.dart';
import 'package:fexercise/view/screen/multiscreen.dart';
import 'package:fexercise/view/screen/test/test_main.dart';
import 'package:fexercise/view/screen/welcomescreen.dart';
import 'package:fexercise/view/widget/test.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/",                            page: () => const FeedPage(),),
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
  GetPage(name: AppRoute.multiscreen,           page: () => const MultiScreen()),
  GetPage(name: AppRoute.mainExercise,          page: () => const MainExercise()),
  GetPage(name: AppRoute.exerciseDetail,        page: () => const ExerciseDetails()),
  GetPage(name: AppRoute.foodList,              page: () => const FoodView(),),
  GetPage(name: AppRoute.foodDetail,            page: () => const FoodDetail(),),
  GetPage(name: AppRoute.bodyAnthropometry,     page: () => const BodyAnthropometry(),),
  GetPage(name: AppRoute.dailyInfo,             page: () => const DailyInfo(),),
  GetPage(name: AppRoute.bowl,                  page: () => const BowlView(),)

];
