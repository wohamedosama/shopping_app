import 'package:flutter/material.dart';
import 'package:shopping_app/model/categories_model/categories_model.dart';

class BuildCatItemToCategoriesScreen extends StatelessWidget {
  const BuildCatItemToCategoriesScreen({Key? key, this.dataModel})
      : super(key: key);
  final DataModel? dataModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image.network(
            dataModel!.image!,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 20),
          Text(
            dataModel!.name!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
