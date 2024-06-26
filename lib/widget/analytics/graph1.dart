import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';



import '../../utils/helper_function.dart';

class LineChartgraph extends StatefulWidget {
  const LineChartgraph({Key? key}) : super(key: key);

  @override
  _LineChartgraphState createState() => _LineChartgraphState();
}

class _LineChartgraphState extends State<LineChartgraph> {
  // crate list of spots for the graph by monthly, yearly of Google Stocks
  List<FlSpot> _daylySpots = [
    FlSpot(0, 20.0),
    FlSpot(1, 20.0),
    FlSpot(2, 30.0),
    FlSpot(3, 10.0),
    FlSpot(4, 40.0),
    FlSpot(5, 60.0),
    FlSpot(6, 40.0),
    FlSpot(7, 80.0),
    FlSpot(8, 60.0),
    FlSpot(9, 70.0),
    FlSpot(10, 50.0),
    FlSpot(11, 150.0),
    FlSpot(12, 70.0),
    FlSpot(13, 80.0),
    FlSpot(14, 60.0),
    FlSpot(15, 70.0),
    FlSpot(16, 60.0),
    FlSpot(17, 80.0),
    FlSpot(18, 110.0),
    FlSpot(19, 130.0),
    FlSpot(20, 100.0),
    FlSpot(21, 130.0),
    FlSpot(22, 160.0),
    FlSpot(23, 190.0),
    FlSpot(24, 150.0),
    FlSpot(25, 170.0),
    FlSpot(26, 180.0),
    FlSpot(27, 140.0),
    FlSpot(28, 150.0),
    FlSpot(29, 150.0),
    FlSpot(30, 130.0)
  ];

  List<FlSpot> _monthlySpots = [
    FlSpot(0, 110.0),
    FlSpot(1, 110.0),
    FlSpot(2, 130.0),
    FlSpot(3, 100.0),
    FlSpot(4, 130.0),
    FlSpot(5, 160.0),
    FlSpot(6, 190.0),
    FlSpot(7, 150.0),
    FlSpot(8, 170.0),
    FlSpot(9, 180.0),
    FlSpot(10, 140.0),
    FlSpot(11, 150.0),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      
        SizedBox(
          height: 10,
        ),
        FadeInUp(
          duration: Duration(milliseconds: 1000),
          from: 30,
          child: Text(
            '+1.5%',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 50),
        FadeInUp(
          duration: Duration(milliseconds: 1000),
          from: 60,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: LineChart(
                mainData(),
                swapAnimationCurve: Curves.easeInOutCubic,
                swapAnimationDuration: Duration(milliseconds: 1000),
              )),
        ),
        AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: MediaQuery.of(context).size.height * 0.3,
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _currentIndex == 0
                          ? Color(0xff161b22)
                          : Color(0xff161b22).withOpacity(0.0),
                    ),
                    child: Text(
                      "D",
                      style: TextStyle(
                          color: _currentIndex == 0
                              ? Colors.blueGrey.shade200
                              : Colors.blueGrey,
                          fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _currentIndex == 1
                          ? Color(0xff161b22)
                          : Color(0xff161b22).withOpacity(0.0),
                    ),
                    child: Text(
                      "M",
                      style: TextStyle(
                          color: _currentIndex == 1
                              ? Colors.blueGrey.shade200
                              : Colors.blueGrey,
                          fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _currentIndex == 2
                          ? Color(0xff161b22)
                          : Color(0xff161b22).withOpacity(0.0),
                    ),
                    child: Text(
                      "Y",
                      style: TextStyle(
                          color: _currentIndex == 2
                              ? Colors.blueGrey.shade200
                              : Colors.blueGrey,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            )),
      ]),
    );
  }

  // Charts Data
  List<Color> gradientColors = [
    Colors.blue,
    Colors.blue,
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
          show: false, horizontalInterval: 1.6, drawVerticalLine: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: true),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 8),
          getTitles: (value) {
            if (_currentIndex == 0) {
              // Assuming daily data
              switch (value.toInt()) {
                case 1:
                  return '0';
                case 2:
                  return '1';

                case 3:
                  return '3';
                case 4:
                  return '4';
                case 5:
                  return '5';
                case 6:
                  return '6';
                case 7:
                  return '7';
                case 8:
                  return '8';
                case 9:
                  return '9';
                case 10:
                  return '10';
                case 11:
                  return '11';
                case 12:
                  return '12';
                case 13:
                  return '13';
                case 14:
                  return '14';
                case 15:
                  return '15';
                case 16:
                  return '16';
                case 17:
                  return '17';
                case 18:
                  return '18';
                case 19:
                  return '19';
                case 20:
                  return '20  ';
                case 21:
                  return '21';
                case 22:
                  return '22';
                case 23:
                  return '23';
                case 24:
                  return '24';
                case 25:
                  return '25';
                case 26:
                  return '26';

                case 27:
                  return '27';
                case 28:
                  return '28';
                case 29:
                  return '29  ';
                case 30:
                  return '30';

                // Add more cases as needed
              }
            } else if (_currentIndex == 1) {
              // Assuming monthly data
              switch (value.toInt()) {
                case 1:
                  return 'JAN';
                case 2:
                  return 'FEB';
                case 3:
                  return 'MAR';
                case 4:
                  return 'APR';
                case 5:
                  return 'MAY';
                case 6:
                  return 'JUN';
                case 7:
                  return 'JUL';
                case 8:
                  return 'AUG';
                case 9:
                  return 'SEP';
                case 10:
                  return 'OCT';
                case 11:
                  return 'NOV';
                case 12:
                  return 'DEC';
              }
            } else if (_currentIndex == 2) {
              // Assuming yearly data
              return '${(value + 10).toInt()}';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
        ),
      ),
      minX: 0,
      maxX: _currentIndex == 0
          ? _daylySpots.length - 1.toDouble()
          : _currentIndex == 1
              ? _monthlySpots.length - 1.toDouble()
              : _currentIndex == 2
                  ? _daylySpots.length - 20.toDouble()
                  : _daylySpots.length.toDouble(),
      minY: 0,
      maxY: 200,
      lineTouchData: LineTouchData(
          getTouchedSpotIndicator:
              (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((index) {
              return TouchedSpotIndicatorData(
                FlLine(
                  color: Colors.white.withOpacity(0.1),
                  strokeWidth: 2,
                  dashArray: [3, 3],
                ),
                FlDotData(
                  show: false,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                    radius: 8,
                    color: [
                      Colors.black,
                      Colors.black,
                    ][index],
                    strokeWidth: 2,
                    strokeColor: Colors.black,
                  ),
                ),
              );
            }).toList();
          },
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipPadding: const EdgeInsets.all(8),
            tooltipBgColor: Color(0xff2e3747).withOpacity(0.8),
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((touchedSpot) {
                return LineTooltipItem(
                  '\$${touchedSpot.y.round()}.00',
                  const TextStyle(color: Colors.white, fontSize: 12.0),
                );
              }).toList();
            },
          ),
          handleBuiltInTouches: true),
      lineBarsData: [
        LineChartBarData(
          spots: _currentIndex == 0
              ? _daylySpots
              : _currentIndex == 1
                  ? _monthlySpots
                  : _daylySpots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: true,
              gradientFrom: Offset(0, 0),
              gradientTo: Offset(0, 1),
              colors: [
                Colors.blue.withOpacity(0.1),
                Colors.blue.withOpacity(0),
              ]),
        )
      ],
    );
  }
}
