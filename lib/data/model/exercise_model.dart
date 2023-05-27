class ExerciseDetailModel {
  num? exerciseId;
  String? exerciseNameEn;
  String? exerciseNameAr;
  String? exerciseUrl;
  num? exerciseDifficulty;
  String? exerciseDescription;
  String? exerciseDescriptionAr;
  String? createTime;
  num? muscleId;
  num? categoryId;

  ExerciseDetailModel(
      {this.exerciseId,
      this.exerciseNameEn,
      this.exerciseNameAr,
      this.exerciseUrl,
      this.exerciseDifficulty,
      this.exerciseDescription,
      this.exerciseDescriptionAr,
      this.createTime,
      this.muscleId,
      this.categoryId});

  ExerciseDetailModel.fromJson(Map<String, dynamic> json) {
    exerciseId = json['exercise_id'];
    exerciseNameEn = json['exercise_name_en'];
    exerciseNameAr = json['exercise_name_ar'];
    exerciseUrl = json['exercise_url'];
    exerciseDifficulty = json['exercise_difficulty'];
    exerciseDescription = json['exercise_description'];
    exerciseDescriptionAr = json['exercise_description_ar'];
    createTime = json['create_time'];
    muscleId = json['muscle_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exercise_id'] = exerciseId;
    data['exercise_name_en'] = exerciseNameEn;
    data['exercise_name_ar'] = exerciseNameAr;
    data['exercise_url'] = exerciseUrl;
    data['exercise_difficulty'] = exerciseDifficulty;
    data['exercise_description'] = exerciseDescription;
    data['exercise_description_ar'] = exerciseDescriptionAr;
    data['create_time'] = createTime;
    data['muscle_id'] = muscleId;
    data['category_id'] = categoryId;
    return data;
  }
}