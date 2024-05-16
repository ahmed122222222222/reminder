import 'package:ah/feuters/home/prestion/view/widget/iteamnalarim.dart';
import 'package:flutter/material.dart';

class Durglis extends StatelessWidget {
  const Durglis({
    super.key,
    required this.colors,
  });

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (context, index) {
          // Calculate the index of the color in the colors list
          int colorIndex = index % colors.length;
          // Use the calculated color index to get the color from the colors list
          Color color = colors[colorIndex];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ItemAlrim(
              color: color,
            ),
          );
        });
  }
}
