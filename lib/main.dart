import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/cubits/login/shop_login_cubit.dart';
import 'package:shopping_app/cubits/shop/shop_cubit.dart';
import 'package:shopping_app/layout/shop/shop_layout.dart';
import 'package:shopping_app/module/login_screen/login_screen.dart';
import 'package:shopping_app/module/on_boarding/on_boarding.dart';
import 'package:shopping_app/module/register_screen/register_screen.dart';
import 'package:shopping_app/module/search/search_screen.dart';
import 'package:shopping_app/my_bloc_observer.dart';
import 'package:shopping_app/shared/network/local/shared_preferences.dart';
import 'package:shopping_app/shared/network/remote/dio_helper.dart';
import 'package:shopping_app/shared/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget? widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? token = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    if (token != null) {
      widget = const ShopLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(ShopApp(
    startWidget: widget,
  ));
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key, this.startWidget}) : super(key: key);
  final Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopLoginCubit()),
        BlocProvider(create: (context) => ShopCubit()..getHomeData()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.light,
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          SearchScreen.id: (context) => const SearchScreen(),
        },
        home: startWidget,
      ),
    );
  }
}
