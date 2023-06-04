class FoodRisk {
  num? highestRisk;

  FoodRisk({this.highestRisk});

  FoodRisk.fromJson(Map<String, dynamic> json) {
    highestRisk = json['highest_risk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['highest_risk'] = highestRisk;
    return data;
  }
}