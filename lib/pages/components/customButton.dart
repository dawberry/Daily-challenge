import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.pressed,
    Key? key,
  }) : super(key: key);
  VoidCallback pressed;
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
            child: const Center(
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}
