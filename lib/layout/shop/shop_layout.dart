import 'package:flutter/material.dart';
import 'package:shopping_app/module/login_screen/login_screen.dart';
import 'package:shopping_app/shared/components/navigator_method.dart';
import 'package:shopping_app/shared/network/local/shared_preferences.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salla'),
      ),
      body: TextButton(
        onPressed: () {
          CacheHelper.removeData(key: 'token').then((value) {
            if (value) {
              NavigateTo().navigateAndReplacement(context, LoginScreen());
            }
          });
        },
        child: const Text("Sign Out"),
      ),
    );
  }
}
