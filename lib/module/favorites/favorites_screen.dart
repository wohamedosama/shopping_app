import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/cubits/shop/shop_cubit.dart';
import 'package:shopping_app/module/favorites/build_favorites_item/build_favorites_item.dart';
import 'package:shopping_app/shared/components/divider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => BuildFavoritesItems(
              dataFavorites: ShopCubit.get(context)
                  .favoritesModel!
                  .data!
                  .dataFavorites[index],
            ),
            separatorBuilder: (context, index) => const DividerItem(),
            itemCount: ShopCubit.get(context)
                .favoritesModel!
                .data!
                .dataFavorites
                .length,
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
