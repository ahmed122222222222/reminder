import 'package:ah/core/styel.dart';
import 'package:flutter/material.dart';

class iteamtexyt extends StatelessWidget {
  const iteamtexyt({
    super.key,
    required this.titel,
    required this.icon,
  });
  final String titel;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.alarm_on),
        Text(
          titel,
          style: AppStyles.stylebold15(context)
              .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
