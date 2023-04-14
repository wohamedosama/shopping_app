import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/cubits/shop/shop_cubit.dart';
import 'package:shopping_app/model/favorites_model/favorites_model.dart';

class BuildFavoritesItems extends StatelessWidget {
  const BuildFavoritesItems({
    Key? key,
    this.dataFavorites,
    this.favoritesModel,
  }) : super(key: key);

  final FavoritesModel? favoritesModel;
  final DataFavorites? dataFavorites;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 120,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image.network(
                    dataFavorites!.products!.image!,
                    width: 120,
                    height: 120,
                  ),
                  if (dataFavorites!.products!.discount != 0)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.red,
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataFavorites!.products!.name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.2,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          dataFavorites!.products!.price.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.2,
                            color: defaultColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        if (dataFavorites!.products!.discount != 0)
                          Text(
                            dataFavorites!.products!.oldPrice.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 14,
                                height: 1.2,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 16.5,
                          backgroundColor: ShopCubit.get(context)
                                  .favorites[dataFavorites!.products!.id]!
                              ? defaultColor
                              : Colors.grey,
                          child: IconButton(
                            onPressed: () {
                              ShopCubit.get(context).changeFavorites(
                                  dataFavorites!.products!.id!);
                            },
                            icon: const Icon(
                              Icons.favorite_border,
                              size: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
