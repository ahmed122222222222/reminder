import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class textcolock extends StatelessWidget {
  const textcolock({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DigitalClock.dark(
        showSeconds: false,
        isLive: true,
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        datetime: dateTime, // Use dateTime
      ),
    );
  }
}