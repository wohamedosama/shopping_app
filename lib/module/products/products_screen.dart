import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/cubits/shop/shop_cubit.dart';
import 'package:shopping_app/module/products/products_builder/products_builder.dart';
import 'package:shopping_app/shared/components/flutter_toast.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if (state is ShopSuccessChangeFavoritesDataState) {
          if (state.changeFavoritesModel!.status == false) {
            ShowFlutterToast.showToast(
              message: state.changeFavoritesModel!.message!,
              state: ToastState.error,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.homeModel != null && cubit.categoriesModel != null,
          builder: (context) => ProductsBuilder(
            homeModel: cubit.homeModel!,
            categoriesModel: cubit.categoriesModel!,
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
