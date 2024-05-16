import 'dart:async';

import 'package:ah/core/styel.dart';
import 'package:ah/feuters/home/prestion/view/widget/colockview.dart';
import 'package:ah/feuters/home/prestion/view/widget/durglistview.dart';

import 'package:ah/feuters/home/prestion/view/widget/textcolok.dart';

import 'package:flutter/material.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({super.key});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  final List<Color> colors = [
    const Color(0xffF166CA).withOpacity(.46),
    const Color(0xff799EFF).withOpacity(.4),
    const Color(0xff009688).withOpacity(.6)
  ];

  late DateTime dateTime; // Declare dateTime as late
  late Timer timer; // Declare timer

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now(); // Initialize dateTime
    // Start a timer to update the time every second
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        // Check if the widget is mounted before updating the state
        setState(() {
          dateTime = DateTime.now(); // Update dateTime
        });
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: LinearProgressIndicator(
            minHeight: 9,
            value: .5,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 35,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const colockview(),
                textcolock(dateTime: dateTime),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "ادويه اليوم",
                  style: AppStyles.stylesemi20(context).copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverFillRemaining(child: Durglis(colors: colors)),
      ],
    );
  }
}
