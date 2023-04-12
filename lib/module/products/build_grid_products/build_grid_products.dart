import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/model/home_model/home_model.dart';

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
