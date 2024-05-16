import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class colockview extends StatelessWidget {
  const colockview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .25,
        child: AnalogClock(
           showSecondHand:true,
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.blue),
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          width: MediaQuery.of(context).size.width * .36,
          isLive: true,
          secondHandColor: Colors.black,
          hourHandColor: Colors.blue,
          minuteHandColor: Colors.deepPurpleAccent,
        
          numberColor: Colors.pinkAccent,
          showNumbers: true,
          showAllNumbers: false,
          textScaleFactor: 1.4,
          showTicks: false,
          showDigitalClock: false,
          datetime: DateTime(2019, 1, 1, 9, 12, 15),
        ),
      ),
    );
  }
}