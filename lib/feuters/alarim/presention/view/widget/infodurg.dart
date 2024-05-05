import 'package:ah/core/styel.dart';
import 'package:ah/feuters/alarim/presention/view/widget/info.dart';
import 'package:flutter/material.dart';

class infodurg extends StatelessWidget {
  const infodurg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "بنادول",
          style: AppStyles.stylebold15(context),
        ),
        info()
      ],
    );
  }
}
