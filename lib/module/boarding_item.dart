import 'package:flutter/cupertino.dart';

import '../model/boarding_model/boarding_model.dart';

class BoardingItem extends StatelessWidget {
  BoardingItem({
    this.model,
    Key? key,
  }) : super(key: key);
  BoardingModel? model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            model!.image,
          ),
        ),
        const SizedBox(height: 30.0),
        Text(
          model!.title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15.0),
        Text(
          model!.body,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
