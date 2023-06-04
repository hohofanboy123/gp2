class BowlModel {
  String? foodNameEn;
  String? foodImage;
  int? bowlItemId;
  int? bowlUserId;
  int? bowlFoodId;
  int? quantity;
  int? totalKcal;
  int? totalCarbs;
  int? totalFats;
  int? totalProtein;

  BowlModel(
      {this.foodNameEn,
      this.foodImage,
      this.bowlItemId,
      this.bowlUserId,
      this.bowlFoodId,
      this.quantity,
      this.totalKcal,
      this.totalCarbs,
      this.totalFats,
      this.totalProtein});

  BowlModel.fromJson(Map<String, dynamic> json) {
    foodNameEn = json['food_name_en'];
    foodImage = json['food_image'];
    bowlItemId = json['bowl_item_id'];
    bowlUserId = json['bowl_user_id'];
    bowlFoodId = json['bowl_food_id'];
    quantity = json['quantity'];
    totalKcal = json['totalKcal'];
    totalCarbs = json['totalCarbs'];
    totalFats = json['totalFats'];
    totalProtein = json['totalProtein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['food_name_en'] = foodNameEn;
    data['food_image'] = foodImage;
    data['bowl_item_id'] = bowlItemId;
    data['bowl_user_id'] = bowlUserId;
    data['bowl_food_id'] = bowlFoodId;
    data['quantity'] = quantity;
    data['totalKcal'] = totalKcal;
    data['totalCarbs'] = totalCarbs;
    data['totalFats'] = totalFats;
    data['totalProtein'] = totalProtein;
    return data;
  }
}