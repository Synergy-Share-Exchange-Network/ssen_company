import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentIndicator extends StatefulWidget {
  const PercentIndicator({Key? key}) : super(key: key);

  @override
  _PercentIndicatorState createState() => _PercentIndicatorState();
}

class _PercentIndicatorState extends State<PercentIndicator> {
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPercentIndicator(
              animation: true,
              animationDuration: 7000,
              radius: 100,
              lineWidth: 50,
              percent: 0.8,
              progressColor: Colors.lightBlue,
              backgroundColor: Colors.lightBlue.shade200,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                '80%',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            LinearPercentIndicator(
              animation: true,
              animationDuration: 7000,
              lineHeight: 40,
              percent: 0.8,
              progressColor: Colors.lightBlue,
              backgroundColor: Colors.lightBlue.shade200,
            )
          ],
        ),
      ),
    );
  }
}
