import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/model/categories_model/categories_model.dart';
import 'package:shopping_app/model/home_model/home_model.dart';
import 'package:shopping_app/module/products/build_categories_list/build_categories_list.dart';
import 'package:shopping_app/module/products/build_grid_products/build_grid_products.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder(
      {Key? key, required this.homeModel, this.categoriesModel})
      : super(key: key);
  final HomeModel homeModel;
  final CategoriesModel? categoriesModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: homeModel.data!.banners
                .map((e) => Image.network(
                      e.image!,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 100,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => BuildCategoriesItem(
                            dataModel: categoriesModel!
                                .categoriesDataModel!.data[index],
                          ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 5),
                      itemCount:
                          categoriesModel!.categoriesDataModel!.data.length),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'New Products',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ],
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
