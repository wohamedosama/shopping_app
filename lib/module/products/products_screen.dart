import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/cubits/shop/shop_cubit.dart';
import 'package:shopping_app/model/home_model/home_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.homeModel != null,
          builder: (context) => ProductsBuilder(homeModel: cubit.homeModel!),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({Key? key, required this.homeModel}) : super(key: key);
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CarouselSlider(
            items: homeModel.data!.banners
                .map((e) => Image.network(
                      '${e.image}',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.51,
              children: List.generate(
                  homeModel.data!.products.length,
                  (index) => BuildGridProducts(
                      productsModel: homeModel.data!.products[index])),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildGridProducts extends StatelessWidget {
  const BuildGridProducts({Key? key, required this.productsModel})
      : super(key: key);
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image.network(
                productsModel.image!,
                width: double.infinity,
                height: 200,
              ),
              if (productsModel.discount != 0)
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productsModel.name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 15, height: 1.2),
                ),
                Row(
                  children: [
                    Text(
                      productsModel.price!.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.2,
                        color: defaultColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    if (productsModel.discount != 0)
                      Text(
                        productsModel.oldPrice!.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 14,
                            height: 1.2,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    const Spacer(),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 18,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
