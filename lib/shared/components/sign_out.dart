import 'package:flutter/cupertino.dart';
import 'package:shopping_app/module/login_screen/login_screen.dart';
import 'package:shopping_app/shared/components/navigator_method.dart';
import 'package:shopping_app/shared/network/local/shared_preferences.dart';

class SignOut {
  static signOut(BuildContext context) {
    CacheHelper.removeData(key: 'token').then((value) {
      if (value) {
        NavigateTo().navigateAndReplacement(context, LoginScreen());
      }
    });
  }
}
