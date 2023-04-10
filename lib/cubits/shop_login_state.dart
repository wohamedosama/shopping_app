part of 'shop_login_cubit.dart';

@immutable
abstract class ShopLoginState {}

class ShopLoginInitial extends ShopLoginState {}

class ShopLoginLoading extends ShopLoginState {}

class ShopLoginSuccess extends ShopLoginState {
  final ShopLoginModel shopLoginModel;

  ShopLoginSuccess(this.shopLoginModel);
}

class ShopLoginFailure extends ShopLoginState {
  final String errMessage;

  ShopLoginFailure(this.errMessage);
}

class ShopChangePasswordVisibility extends ShopLoginState {}

class AppChangeModeState extends ShopLoginState {}
