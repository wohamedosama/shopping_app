import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/cubits/shop/shop_cubit.dart';
import 'package:shopping_app/shared/components/divider.dart';

import 'build_categories_item_to_categories_screen/build_categories_item_to_categories_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) => BuildCatItemToCategoriesScreen(
                  dataModel:
                      cubit.categoriesModel!.categoriesDataModel!.data[index],
                ),
            separatorBuilder: (context, index) => const DividerItem(),
            itemCount: cubit.categoriesModel!.categoriesDataModel!.data.length);
      },
    );
  }
}
