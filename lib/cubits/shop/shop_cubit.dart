import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/model/categories_model/categories_model.dart';
import 'package:shopping_app/model/change_favorites_model/favorites_model.dart';
import 'package:shopping_app/model/favorites_model/favorites_model.dart';
import 'package:shopping_app/model/home_model/home_model.dart';
import 'package:shopping_app/module/categories/categories_screen.dart';
import 'package:shopping_app/module/favorites/favorites_screen.dart';
import 'package:shopping_app/module/products/products_screen.dart';
import 'package:shopping_app/module/settings/settings_screen.dart';
import 'package:shopping_app/shared/end_points.dart';
import 'package:shopping_app/shared/network/remote/dio_helper.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  CategoriesModel? categoriesModel;
  ChangeFavoritesModel? changeFavoritesModel;
  FavoritesModel? favoritesModel;

  Map<int?, bool?> favorites = {};
  int currentIndex = 0;
  List<Widget> screens = const [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationState());
  }

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getDate(
      url: home,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id!: element.inFavorite!,
        });
      });
      print(favorites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopLFailureHomeDataState(error.toString()));
    });
  }

  void getCategoriesDate() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getDate(
      token: token,
      url: getCategories,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopLFailureHomeDataState(error.toString()));
    });
  }

  void changeFavorites(int? productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());

    DioHelper.postData(
      url: favorite,
      data: {
        'product_id': productId!,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value!.data);
      print(value.data);
      if (!changeFavoritesModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }
      emit(ShopSuccessChangeFavoritesDataState(changeFavoritesModel));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      print(error.toString());
      emit(ShopLFailureChangeFavoritesDataState(error.toString()));
    });
  }

  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getDate(
      url: favorite,
      token: token,
    ).then((value) {
      emit(ShopSuccessGetFavoritesState());
      favoritesModel = FavoritesModel.fromJson(value.data!);
    }).catchError((error) {
      print(error.toString());
      emit(ShopFailureGetFavoritesState(error.toString()));
    });
  }
}
