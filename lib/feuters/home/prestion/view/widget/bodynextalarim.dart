import 'package:ah/core/styel.dart';
import 'package:flutter/material.dart';

class BodNexAlarim extends StatelessWidget {
  const BodNexAlarim({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset("Asset/image/Rectangle 25.png"),
      const SizedBox(
        width: 20,
      ),
      Column(
        children: [
          Text(
            "بناول اكستر ",
            style: AppStyles.stylebold15(context),
          ),
          Text(
            " 3 مرات ",
            style: AppStyles.stylebold15(context),
          ),
          Text(
            " بعد الاكل ",
            style: AppStyles.stylebold15(context),
          ),
        ],
      ),
      const Spacer(),
      IconButton(
          onPressed: () {}, icon: const Icon(Icons.check_box_outline_blank))
    ]);
  }
}
