import 'package:ah/core/styel.dart';
import 'package:flutter/material.dart';

class InfoTake extends StatefulWidget {
  const InfoTake({super.key});

  @override
  State<InfoTake> createState() => _InfoTakeState();
}

class _InfoTakeState extends State<InfoTake> {
  String s = "اختار القيمه";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "ذكرني  كل ",
          style: AppStyles.stylebold20(context).copyWith(color: Colors.black),
        ),
        const SizedBox(
          width: 30,
        ),
        DropdownButton<String>(
          items: ["8", "12", "24", "6"].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // يمكنك هنا تنفيذ الإجراء المناسب بناءً على القيمة المحددة
            setState(() {
              s = newValue!;
            });
          },
          hint: Text(
            s,
            style: AppStyles.stylebold20(context).copyWith(color: Colors.blue),
          ), // اختياري: رسالة عرض افتراضية
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          "ساعات ",
          style: AppStyles.stylebold20(context).copyWith(color: Colors.black),
        )
      ],
    );
  }
}
