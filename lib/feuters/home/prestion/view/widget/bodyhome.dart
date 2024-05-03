import 'package:ah/core/styel.dart';
import 'package:ah/feuters/home/prestion/view/widget/durglistview.dart';
import 'package:ah/feuters/home/prestion/view/widget/iteamnextakarim.dart';
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
                Text(
                  "التالي",
                  style: AppStyles.stylesemi20(context)
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 23),
                ),
                const SizedBox(
                  height: 20,
                ),
                IteamnextAlarim(
                  color: const Color(0xff2A5EE4).withOpacity(.70),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "ادويه اليوم",
                  style: AppStyles.stylesemi20(context)
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 23),
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
