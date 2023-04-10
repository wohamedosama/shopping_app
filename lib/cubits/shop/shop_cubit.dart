import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/module/categories/categories_screen.dart';
import 'package:shopping_app/module/favorites/favorites_screen.dart';
import 'package:shopping_app/module/products/profucts_screen.dart';
import 'package:shopping_app/module/settings/settings_screen.dart';

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
}
