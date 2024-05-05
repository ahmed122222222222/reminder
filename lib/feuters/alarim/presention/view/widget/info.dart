import 'package:ah/feuters/alarim/presention/view/widget/iteamtext.dart';
import 'package:flutter/material.dart';

class info extends StatelessWidget {
  const info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        iteamtexyt(titel: "3 مرات", icon: Icons.calendar_today),
        iteamtexyt(
          titel: '12 م',
          icon: Icons.alarm_sharp,
        )
      ],
    );
  }
}
