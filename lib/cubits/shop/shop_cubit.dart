import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  HomeModel? homeModel;

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getDate(url: home).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel!.data!.banners![0].image);
      print(homeModel!.status);
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopLFailureHomeDataState(error.toString()));
    });
  }
}
