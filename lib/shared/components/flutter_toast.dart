import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowFlutterToast {
  static void showToast({
    required String message,
    required ToastState state,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: chooseToastColor(
          state: state,
        ),
        textColor: Colors.white,
        fontSize: 16.0,
      );
}

enum ToastState {
  success,
  error,
  warning,
}

Color chooseToastColor({ToastState? state}) {
  Color? color;
  switch (state!) {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.error:
      color = Colors.red;
      break;

    case ToastState.warning:
      color = Colors.yellow;
      break;
  }
  return color!;
}
