class FavoritesModel {
  bool? status;
  Data? data;

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJosn(json['data']);
  }
}

class Data {
  int? currentPage;
  List<DataFavorites> dataFavorites = [];

  Data.fromJosn(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json["data"].forEach((element) {
      dataFavorites.add(DataFavorites.fromJson(element));
    });
  }
}

class DataFavorites {
  int? id;
  Products? products;

  DataFavorites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    products = Products.fromJson(json['product']);
  }
}

class Products {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
  }
}
