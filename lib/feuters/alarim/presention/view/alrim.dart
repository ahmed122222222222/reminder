import 'package:ah/core/styel.dart';
import 'package:ah/feuters/add/prsention/view/add.dart';

import 'package:flutter/material.dart';

import 'widget/bodyalarim.dart';

class alarim extends StatefulWidget {
  const alarim({super.key});

  @override
  State<alarim> createState() => _alarimState();
}

class _alarimState extends State<alarim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اضافه منبه ",
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
      
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (builder)=>AddAlamrim()));},
      child: Icon(Icons.add),backgroundColor: Colors.blue.shade200,),
    );
  }
}

