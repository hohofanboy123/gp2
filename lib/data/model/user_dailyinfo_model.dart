class UserDailyInfoModel {
  int? tDEE;
  int? carbsDaily;
  int? fatsDaily;
  int? proteinDaily;
  int? consumedKcal;
  int? consumedCarbs;
  int? consumedFats;
  int? consumedProtein;

  UserDailyInfoModel(
      {this.tDEE,
      this.carbsDaily,
      this.fatsDaily,
      this.proteinDaily,
      this.consumedKcal,
      this.consumedCarbs,
      this.consumedFats,
      this.consumedProtein});

  UserDailyInfoModel.fromJson(Map<String, dynamic> json) {
    tDEE = json['TDEE'];
    carbsDaily = json['carbs_daily'];
    fatsDaily = json['fats_daily'];
    proteinDaily = json['protein_daily'];
    consumedKcal = json['consumed_kcal'];
    consumedCarbs = json['consumed_carbs'];
    consumedFats = json['consumed_fats'];
    consumedProtein = json['consumed_protein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TDEE'] = tDEE;
    data['carbs_daily'] = carbsDaily;
    data['fats_daily'] = fatsDaily;
    data['protein_daily'] = proteinDaily;
    data['consumed_kcal'] = consumedKcal;
    data['consumed_carbs'] = consumedCarbs;
    data['consumed_fats'] = consumedFats;
    data['consumed_protein'] = consumedProtein;
    return data;
  }
}