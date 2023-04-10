import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Text(
          'Categories Screen',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
