import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Daily",
                style: TextStyle(fontFamily: "logo", fontSize: 50),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text("Challenge",
                  style: const TextStyle(fontFamily: "logo", fontSize: 50))
            ],
          ),
        ],
      ),
    );
  }
}
