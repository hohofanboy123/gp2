class FoodModel {
  int? foodId;
  String? foodNameEn;
  String? foodNameAr;
  num? kcal;
  num? fats;
  num? carbs;
  num? protein;
  String? createTime;
  int? foodTypeId;
  String? foodImage;

  FoodModel(
      {this.foodId,
      this.foodNameEn,
      this.foodNameAr,
      this.kcal,
      this.fats,
      this.carbs,
      this.protein,
      this.createTime,
      this.foodTypeId,
      this.foodImage});

  FoodModel.fromJson(Map<String, dynamic> json) {
    foodId = json['food_id'];
    foodNameEn = json['food_name_en'];
    foodNameAr = json['food_name_ar'];
    kcal = json['kcal'];
    fats = json['fats'];
    carbs = json['carbs'];
    protein = json['protein'];
    createTime = json['create_time'];
    foodTypeId = json['food_type_id'];
    foodImage = json['food_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['food_id'] = foodId;
    data['food_name_en'] = foodNameEn;
    data['food_name_ar'] = foodNameAr;
    data['kcal'] = kcal;
    data['fats'] = fats;
    data['carbs'] = carbs;
    data['protein'] = protein;
    data['create_time'] = createTime;
    data['food_type_id'] = foodTypeId;
    data['food_image'] = foodImage;
    return data;
  }
}