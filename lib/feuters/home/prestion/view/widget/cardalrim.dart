import 'package:ah/core/styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardAlarim extends StatelessWidget {
  const CardAlarim({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        leading: Image.asset("Asset/image/Rectangle 25.png"),
        trailing: Text(
          "5 ص",
          style: AppStyles.stylebold15(context),
        ),
        title: Text(
          "بلافكس",
          style: AppStyles.stylebold15(context),
        ),
        subtitle: Text(
          "1 كبسوله",
          style: AppStyles.stylebold15(context).copyWith(color: Colors.black38),
        ),
      ),
    );
  }
}
