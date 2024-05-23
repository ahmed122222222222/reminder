import 'package:ah/core/styel.dart';
import 'package:ah/feuters/home/prestion/view/widget/notifactionpending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class BodNexAlarim extends StatefulWidget {
  const BodNexAlarim({
    super.key,
  });

  @override
  State<BodNexAlarim> createState() => _BodNexAlarimState();
}

class _BodNexAlarimState extends State<BodNexAlarim> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
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
