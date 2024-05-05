import 'package:flutter/material.dart';

class IteamAction extends StatelessWidget {
  const IteamAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       CircleAvatar(
         backgroundColor: Colors.blue.withOpacity(.2),
         child: Icon(Icons.edit),
       ),
       SizedBox(width: 10,),
       CircleAvatar(
         backgroundColor: Colors.red.withOpacity(.5),
         child: Icon(Icons.delete),
       ),
       
     ],
    );
  }
}