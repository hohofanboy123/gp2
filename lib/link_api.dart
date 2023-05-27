class ApiLinks{
  static const String server = "https://fexercise.com/fexercise";
  static const String imagestatic = "https://fexercise.com/fexercise/upload";

  static const String categoriesImg = "$imagestatic/categories";
  static const String muscleImg = "$imagestatic/muscle";
  static const String foodImg = "$imagestatic/food";


  //---------------------------------------AUTH---------------------------------------//
  static const String signUp             = "$server/auth/sign_up.php";
  static const String signUpCode         = "$server/auth/verification_code.php";
  static const String signIn             = "$server/auth/sign_in.php";
  static const String checkEmail         = "$server/forget_password/checkemail.php";
  static const String resetPasswordCode  = "$server/forget_password/reset_password_code.php";
  static const String resetPassword      = "$server/forget_password/reset_password.php";

  //---------------------------------------CAT---------------------------------------//
  static const String categories         = "$server/categories/view.php";
  static const String muscles            = "$server/muscle/muscle.php";
  static const String exercise           = "$server/exercise_detail/exercise_detail.php";
  static const String food               = "$server/food/food_data.php";

  static const String bodyData           = "$server/update_data/update_body.php";




}