class UserDailyInfo {
  String? gender;
  int? weight;
  int? height;
  int? age;

  UserDailyInfo({this.gender, this.weight, this.height, this.age});

  UserDailyInfo.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    weight = json['weight'];
    height = json['height'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    data['weight'] = weight;
    data['height'] = height;
    data['age'] = age;
    return data;
  }
}