import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.pressed,
    required this.text,
    Key? key,
  }) : super(key: key);
  VoidCallback pressed;
  final text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 60,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
        child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            onPressed: pressed,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}
