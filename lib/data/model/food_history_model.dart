class FoodHistoryModel {
  String? foodNameEn;
  String? foodImage;
  int? foodEatenId;
  int? userId;
  int? foodId;
  int? quantity;
  int? kcal;
  int? carbs;
  int? fats;
  int? protein;
  String? eatDate;

  FoodHistoryModel(
      {this.foodNameEn,
      this.foodImage,
      this.foodEatenId,
      this.userId,
      this.foodId,
      this.quantity,
      this.kcal,
      this.carbs,
      this.fats,
      this.protein,
      this.eatDate});

  FoodHistoryModel.fromJson(Map<String, dynamic> json) {
    foodNameEn = json['food_name_en'];
    foodImage = json['food_image'];
    foodEatenId = json['food_eaten_id'];
    userId = json['user_id'];
    foodId = json['food_id'];
    quantity = json['quantity'];
    kcal = json['kcal'];
    carbs = json['carbs'];
    fats = json['fats'];
    protein = json['protein'];
    eatDate = json['eat_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['food_name_en'] = foodNameEn;
    data['food_image'] = foodImage;
    data['food_eaten_id'] = foodEatenId;
    data['user_id'] = userId;
    data['food_id'] = foodId;
    data['quantity'] = quantity;
    data['kcal'] = kcal;
    data['carbs'] = carbs;
    data['fats'] = fats;
    data['protein'] = protein;
    data['eat_date'] = eatDate;
    return data;
  }
}