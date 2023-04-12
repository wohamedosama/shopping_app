import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/cubits/shop/shop_cubit.dart';
import 'package:shopping_app/module/products/products_builder/products_builder.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
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
