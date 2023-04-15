part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final ShopLoginModel shopLoginModel;
  RegisterSuccessState(this.shopLoginModel);
}

class RegisterFailureState extends RegisterState {
  final String errorMessage;

  RegisterFailureState(this.errorMessage);
}

class RegisterChangePasswordVisibility extends RegisterState {}
