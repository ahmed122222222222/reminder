import 'package:flutter/material.dart';

class Typedurg extends StatelessWidget {
  const Typedurg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Center(
                child: Image.asset(
              "Asset/image/Dose.png",
              width: 30,
              height: 30,
              color: Colors.black,
            ))),
        const SizedBox(
          width: 30,
        ),
        CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Center(
                child: Image.asset(
              "Asset/image/Insulin Pen.png",
              width: 30,
              height: 30,
              color: Colors.black,
            ))),
        const SizedBox(
          width: 30,
        ),
        CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Center(
                child: Image.asset(
              "Asset/image/Pill.png",
              width: 30,
              height: 30,
              color: Colors.black,
            ))),
        const SizedBox(
          width: 30,
        ),
        CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Center(
                child: Image.asset(
              "Asset/image/Spray.png",
              width: 30,
              height: 30,
              color: Colors.black,
            ))),
        const SizedBox(
          width: 30,
        ),
        CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Center(
              child: Image.asset(
            "Asset/image/Supplement Bottle.png",
            width: 30,
            height: 30,
            color: Colors.black,
          )),
        )
      ],
    );
  }
}
