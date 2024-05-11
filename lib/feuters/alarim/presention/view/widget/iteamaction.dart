import 'package:ah/feuters/add/data/modeladdd.dart';
import 'package:ah/feuters/alarim/presention/manager/cubit/get_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IteamAction extends StatelessWidget {
  const IteamAction({
    super.key, required this.addmodel,
  });
  final Addmodel addmodel ;
  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
      GestureDetector(
        onTap: () {
          addmodel.delete() ;
        BlocProvider.of<GetCubit>(context).fetchDataFromHive("alarim");
        }
         ,
         child: CircleAvatar(
           backgroundColor: Colors.blue.withOpacity(.2),
           child: Icon(Icons.edit),
         ),
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