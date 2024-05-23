import 'package:ah/feuters/add/data/modeladdd.dart';
import 'package:ah/feuters/alarim/presention/view/widget/iteamtext.dart';
import 'package:flutter/material.dart';

class info extends StatelessWidget {
  const info({
    super.key, required this.addmodel,
  });
final Addmodel addmodel;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        iteamtexyt(titel:addmodel.durgname, icon: Icons.person_2_rounded),
        SizedBox(width: 10,),
        iteamtexyt(
          titel: addmodel.hours,
          icon: Icons.alarm_sharp,
        )
      ],
    );
  }
}
