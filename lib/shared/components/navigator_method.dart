import 'package:flutter/material.dart';

class NavigateTo {
  void navigateTo(context, widget) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );

  void navigateAndReplacement(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => false,
      );
}
