import 'package:ah/feuters/home/prestion/view/widget/bodynextalarim.dart';
import 'package:flutter/material.dart';

class IteamnextAlarim extends StatelessWidget {
  const IteamnextAlarim({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: BodNexAlarim(),
      ),
    );
  }
}
