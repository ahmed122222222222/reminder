import 'package:ah/feuters/alarim/presention/view/widget/bodylistview.dart';
import 'package:flutter/widgets.dart';

class Bodalarim extends StatelessWidget {
  const Bodalarim({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Bodylistview(),
      ),
    );
  }
}
