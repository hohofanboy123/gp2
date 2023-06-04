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
  static const String googleSignIn       = "$server/auth/sign_google.php";
  static const String checkEmail         = "$server/forget_password/checkemail.php";
  static const String resetPasswordCode  = "$server/forget_password/reset_password_code.php";
  static const String resetPassword      = "$server/forget_password/reset_password.php";

  //---------------------------------------CAT---------------------------------------//
  static const String categories         = "$server/categories/view.php";
  static const String muscles            = "$server/muscle/muscle.php";
  static const String exercise           = "$server/exercise_detail/exercise_detail.php";
  static const String food               = "$server/food/food_data.php";

  static const String bodyData           = "$server/update_data/update_body.php";

  static const String foodHistory        = "$server/food/food_history.php";

  static const String addToBowl          = "$server/bowl/add_to_bowl.php";

  static const String bowlItems          = "$server/bowl/bowl_data.php";

  static const String addItemsToHistory  = "$server/bowl/add_to_food_history.php";

  static const String removeItemFromBowl = "$server/bowl/remove_from_bowl.php";

  static const String emptyBowl          = "$server/bowl/empty_bowl.php";

  static const String foodRisk           = "$server/food/food_allergy.php";

  static const String postData           = "$server/feed/post_data.php";

  static const String postAPost          = "$server/feed/post.php";

  static const String commentData        = "$server/feed/comment_data.php";

  static const String commentAComment    = "$server/feed/comment.php";

  static const String searchFood         = "$server/food/find_food.php";

  static const String insertAllergy      = "$server/update_data/insert_allergy.php";

  static const String resetDailyInfo     = "$server/daily_info/daily_info_update.php";

  static const String dailyInfo          = "$server/daily_info/daily_info.php";

  static const String updateInfo         = "$server/bowl/update_info.php";



}