part of 'shop_login_cubit.dart';

@immutable
abstract class ShopLoginState {}

class ShopLoginInitial extends ShopLoginState {}

class ShopLoginLoading extends ShopLoginState {}

class ShopLoginSuccess extends ShopLoginState {}

class ShopLoginFailure extends ShopLoginState {
  final String errMessage;
  ShopLoginFailure(this.errMessage);
}
