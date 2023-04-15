import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/model/shop_login_model/shop_login_model.dart';
import 'package:shopping_app/shared/end_points.dart';
import 'package:shopping_app/shared/network/remote/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? shopLoginModel;

  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String userName,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: register,
      data: {
        'email': email,
        'password': password,
        'phone': phone,
        'userName': userName,
      },
      token: token,
    ).then((value) {
      shopLoginModel = ShopLoginModel.fromJsom(value!.data);
      emit(RegisterSuccessState(shopLoginModel!));
    }).catchError((error) {
      emit(RegisterFailureState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibility());
  }
}
