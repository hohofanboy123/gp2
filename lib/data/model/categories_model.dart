class CategoriesModel {
  num? categoryId;
  String? categoryNameEn;
  String? categoryNameAr;
  String? categoryIcon;
  String? createDate;

  CategoriesModel(
      {this.categoryId,
      this.categoryNameEn,
      this.categoryNameAr,
      this.categoryIcon,
      this.createDate});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryNameEn = json['category_name_en'];
    categoryNameAr = json['category_name_ar'];
    categoryIcon = json['category_icon'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name_en'] = categoryNameEn;
    data['category_name_ar'] = categoryNameAr;
    data['category_icon'] = categoryIcon;
    data['create_date'] = createDate;
    return data;
  }
}