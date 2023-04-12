part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class ChangeBottomNavigationState extends ShopState {}

class ShopLoadingHomeDataState extends ShopState {}

class ShopSuccessHomeDataState extends ShopState {}

class ShopLFailureHomeDataState extends ShopState {
  final String errorMessage;

  ShopLFailureHomeDataState(this.errorMessage);
}

class ShopSuccessCategoriesDataState extends ShopState {}

class ShopLFailureCategoriesDataState extends ShopState {
  final String errorMessage;

  ShopLFailureCategoriesDataState(this.errorMessage);
}

class ShopChangeFavoritesState extends ShopState {}

class ShopSuccessChangeFavoritesDataState extends ShopState {
  final ChangeFavoritesModel? changeFavoritesModel;

  ShopSuccessChangeFavoritesDataState(this.changeFavoritesModel);
}

class ShopLFailureChangeFavoritesDataState extends ShopState {
  final String errorMessage;

  ShopLFailureChangeFavoritesDataState(this.errorMessage);
}

class ShopSuccessGetFavoritesState extends ShopState {}

class ShopFailureGetFavoritesState extends ShopState {
  final String errorMessage;

  ShopFailureGetFavoritesState(this.errorMessage);
}
