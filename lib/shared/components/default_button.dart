import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  double radius = 10.0,
  bool isUpperCase = true,
  required void Function()? onPressed,
  required String text,
}) =>
    Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
