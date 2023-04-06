import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/cubits/shop_login_cubit.dart';
import 'package:shopping_app/module/login_screen/login_screen.dart';
import 'package:shopping_app/module/on_boarding/on_boarding.dart';
import 'package:shopping_app/module/register_screen/register_screen.dart';
import 'package:shopping_app/my_bloc_observer.dart';
import 'package:shopping_app/shared/themes/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopLoginCubit()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.light,
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
        },
        home: OnBoardingScreen(),
      ),
    );
  }
}
