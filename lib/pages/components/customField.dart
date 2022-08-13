import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  CustomField(
      {Key? key,
      required this.text,
      this.controller,
      required this.isPass,
      required this.validator})
      : super(key: key);
  String text;
  final controller;
  bool isPass;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: isPass ? true : false,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white,
                )),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.white,
                )),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.white,
                ))),
      ),
    );
  }
}
