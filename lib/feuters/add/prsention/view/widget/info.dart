import 'package:ah/core/styel.dart';

import 'package:flutter/material.dart';

class InfoTake extends StatefulWidget {
  const InfoTake({Key? key});

  @override
  State<InfoTake> createState() => _InfoTakeState();
}
String mo="0";
int memer=0;
class _InfoTakeState extends State<InfoTake> {
  String s = "اختار القيمه";
  int divideValue = 1; // قيمة القسمة الافتراضية
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "ذكرني  كل ",
          style: AppStyles.stylebold20(context).copyWith(color: Colors.black),
        ),
       
        DropdownButton<String>(
          items: ["8", "12", "24", "6"].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // تحديث الحالة بقيمة القسمة الجديدة
            setState(() {
              s = newValue!;
              divideValue = divideBySelectedValue(newValue);
              memer=divideBySelectedValue(newValue);
              mo=newValue!;
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
        ),
      
        Text(
          "التكرار: $divideValue", // عرض قيمة القسمة
          style: AppStyles.stylebold20(context).copyWith(color: Colors.blue),
        ),
      ],
    );
  }
}

// دالة لتقسيم 24 على القيمة المحددة، إذا كانت قيمة محددة
int divideBySelectedValue(String? value) {
  if (value != null) {
    int selectedValue = int.parse(value);
    if (selectedValue != 0) {
      return 24 ~/ selectedValue;
    }
  }
  return 1; // إذا لم يتم تحديد قيمة، يُرجع 1
}

