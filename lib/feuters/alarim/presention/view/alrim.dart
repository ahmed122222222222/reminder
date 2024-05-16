import 'package:ah/core/styel.dart';
import 'package:ah/feuters/add/prsention/view/add.dart';
import 'package:ah/feuters/alarim/presention/manager/cubit/get_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/bodyalarim.dart';

class alarim extends StatefulWidget {
  const alarim({super.key});

  @override
  State<alarim> createState() => _alarimState();
}

class _alarimState extends State<alarim> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "التذكيرات",
            style: AppStyles.stylebold24(context),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.alarm_outlined,
                color: Colors.blue,
              ),
            )
          ],
        ),
        body: Bodalarim(),
      
      ),
    );
  }
}
