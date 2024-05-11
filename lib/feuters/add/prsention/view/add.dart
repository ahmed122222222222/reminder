import 'package:ah/core/styel.dart';
import 'package:ah/feuters/add/prsention/manager/cubit/add_cubit.dart';
import 'package:ah/feuters/add/prsention/view/widget/bodyadd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAlamrim extends StatelessWidget {
  const AddAlamrim({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: Scaffold(
           appBar: AppBar(
          title: Text(
            "اضافه دواء ",
            style: AppStyles.stylebold24(context),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.add,
                color: Colors.blue,
              ),
            )
          ],
        ),
        body: const Bodyadd()
      ),
    );
  }
}


