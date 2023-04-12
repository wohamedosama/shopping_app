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
