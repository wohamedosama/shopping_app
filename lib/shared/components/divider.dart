import 'package:flutter/material.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 2,
      color: Colors.grey,
      thickness: 1,
      indent: 20,
    );
  }
}
