import 'package:ah/feuters/home/prestion/view/widget/cardalrim.dart';
import 'package:flutter/material.dart';

class ItemAlrim extends StatelessWidget {
  const ItemAlrim({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: CardAlarim(color: color),
    );
  }
}
