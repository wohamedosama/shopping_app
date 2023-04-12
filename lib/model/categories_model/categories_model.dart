class CategoriesModel {
  bool? status;
  CategoriesDataModel? categoriesDataModel;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    categoriesDataModel = CategoriesDataModel.formJson(json['data']);
  }
}

class CategoriesDataModel {
  int? currentPage;
  List<DataModel> data = [];

  CategoriesDataModel.formJson(Map<String, dynamic> json) {
    json["data"].forEach((element) {
      data.add(DataModel.fromJson(element));
    });
  }
}

class DataModel {
  int? id;
  String? name;
  String? image;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
