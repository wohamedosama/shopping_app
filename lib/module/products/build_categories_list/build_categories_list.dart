import 'package:flutter/material.dart';
import 'package:shopping_app/model/categories_model/categories_model.dart';

class BuildCategoriesItem extends StatelessWidget {
  const BuildCategoriesItem({Key? key, this.dataModel}) : super(key: key);
  final DataModel? dataModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Image.network(
          dataModel!.image!,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Container(
          width: 100,
          color: Colors.black.withOpacity(0.8),
          child: Text(
            dataModel!.name!,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
