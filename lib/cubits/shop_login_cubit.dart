import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/model/shop_login_model/shop_login_model.dart';
import 'package:shopping_app/shared/network/local/dio_helper.dart';
import 'package:shopping_app/shared/network/remote/end_points.dart';

part 'shop_login_state.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitial());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? shopLoginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoading());
    DioHelper.postData(url: login, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value!.data);
      shopLoginModel = ShopLoginModel.fromJsom(value.data);
      print(shopLoginModel!.message);
      print(shopLoginModel!.status);
      print(shopLoginModel!.data!.email);
      print(shopLoginModel!.data!.phone);
      emit(ShopLoginSuccess(shopLoginModel!));
    }).catchError((error) {
      print(error.toString());

      emit(ShopLoginFailure(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibility());
  }
}
