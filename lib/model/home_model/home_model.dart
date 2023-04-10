class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel.fromJson(json) {
    status = json['status'];
    data = json.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<BannersModel>? banners;
  List<ProductsModel>? products;

  HomeDataModel.fromJson(json) {
    json['banners'].forEach((element) {
      banners!.add(element);
    });

    json['products'].forEach((element) {
      products!.add(element);
    });
  }
}

class BannersModel {
  int? id;
  String? image;

  BannersModel.fromJson(json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductsModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavorite;
  bool? inCart;

  ProductsModel.fromJson(json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorite = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
