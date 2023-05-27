class MuscleModel {
  num? muscleId;
  String? muscleNameEn;
  String? muscleNameAr;
  String? muscleImage;
  String? createDate;
  num? catId;

  MuscleModel(
      {this.muscleId,
      this.muscleNameEn,
      this.muscleNameAr,
      this.muscleImage,
      this.createDate,
      this.catId});

  MuscleModel.fromJson(Map<String, dynamic> json) {
    muscleId = json['muscle_id'];
    muscleNameEn = json['muscle_name_en'];
    muscleNameAr = json['muscle_name_ar'];
    muscleImage = json['muscle_image'];
    createDate = json['create_date'];
    catId = json['cat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['muscle_id'] = muscleId;
    data['muscle_name_en'] = muscleNameEn;
    data['muscle_name_ar'] = muscleNameAr;
    data['muscle_image'] = muscleImage;
    data['create_date'] = createDate;
    data['cat_id'] = catId;
    return data;
  }
}