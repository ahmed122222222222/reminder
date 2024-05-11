import 'package:ah/feuters/add/data/modeladdd.dart';
import 'package:ah/feuters/alarim/presention/view/widget/infodurg.dart';
import 'package:ah/feuters/alarim/presention/view/widget/iteamaction.dart';
import 'package:flutter/material.dart';

class bodycontiner extends StatelessWidget {
  const bodycontiner({
    super.key, required this.addmodel,
  });
   final Addmodel addmodel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          infodurg(addmodel: addmodel,),
          IteamAction(addmodel:addmodel,)
        ],
      ),
    );
  }
}
