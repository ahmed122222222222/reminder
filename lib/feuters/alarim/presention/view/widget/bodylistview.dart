import 'package:ah/feuters/add/data/modeladdd.dart';
import 'package:ah/feuters/alarim/presention/view/widget/bodycontiner.dart';
import 'package:flutter/material.dart';

class Bodylistview extends StatelessWidget {
  const Bodylistview({
    super.key, required this.addmodel,
  });
 final Addmodel addmodel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff799EFF).withOpacity(.9)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: bodycontiner(addmodel: addmodel,),
    );
  }
}
