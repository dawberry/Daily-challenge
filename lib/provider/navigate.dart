import 'package:flutter/material.dart';

class CustomNavigate {
  void nav(page, BuildContext context) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (builder) => page), (route) => false);
  }
}
