// import 'dart:ui';
// import 'package:animate_do/animate_do.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../../utils/helper_function.dart';
// import 'graph_generator.dart';

LineChartData mainData({
  required int currentIndex,
  required List<FlSpot> dailySpots,
  required List<FlSpot> monthlySpots,
  required List<FlSpot> yearlySpots,
  required List<String> xLabelsDay,
  required List<String> xLabelsMonth,
  required List<String> xLabelsYear,
}) {
  List<FlSpot> spots = currentIndex == 0
      ? dailySpots
      : currentIndex == 1
          ? monthlySpots
          : currentIndex == 2
              ? yearlySpots
              : dailySpots;
  double maxY = 0;
  double minX;
  double maxX;
  if (currentIndex == 0) {
    int startIndex = (dailySpots.length > 10) ? dailySpots.length - 10 : 0;
    int endIndex = dailySpots.length - 1;
    minX = 0;
    for (int i = startIndex; i <= endIndex; i++) {
      if (dailySpots[i].y > maxY) {
        maxY = dailySpots[i].y;
      }
    }
    maxX = dailySpots.length - 1.toDouble();
  } else if (currentIndex == 1) {
    int startIndex = (monthlySpots.length > 1) ? monthlySpots.length - 5 : 0;
    int endIndex = monthlySpots.length - 1;
    for (int i = startIndex; i <= endIndex; i++) {
      if (monthlySpots[i].y > maxY) {
        maxY = dailySpots[i].y;
      }
    }
    minX = 0;
    maxX = xLabelsMonth.length - 1.toDouble();
  } else if (currentIndex == 2) {
    minX = 0;
    maxX = xLabelsYear.length - 1.toDouble();
  } else {
    minX = 0;
    maxX = spots.length.toDouble();
  }
  return LineChartData(
    borderData: FlBorderData(
      show: false,
    ),
    gridData: FlGridData(
        show: true,
        drawHorizontalLine: false,
        horizontalInterval: 10,
        drawVerticalLine: false),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: SideTitles(showTitles: true),
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 8),
        getTitles: (value) {
          if (currentIndex == 0) {
            // Assuming daily data
            int index = value.toInt();
            // switch (value.toInt()) {
            //! display dates in mmm-dd form
            if (index >= 0 && index < xLabelsDay.length) {
              return xLabelsDay[index];
            }
            // Add more cases as needed
          } else if (currentIndex == 1) {
            int index = value.toInt();
            // Assuming monthly data
            // switch (value.toInt()) {
            //   //!
            // }
            if (index >= 0 && index < xLabelsMonth.length) {
              return xLabelsMonth[index];
            }
          } else if (currentIndex == 2) {
            // Assuming yearly data
            int index = value.toInt();
            // return '${(value + 10).toInt()}';
            if (index >= 0 && index < xLabelsYear.length) {
              return xLabelsYear[index];
            }
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
    minX: minX,
    maxX: maxX,
    minY: 0,
    maxY: maxY,
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
          tooltipBgColor: const Color(0xff2e3747).withOpacity(0.8),
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
        spots: currentIndex == 0
            ? dailySpots
            : currentIndex == 1
                ? monthlySpots
                : currentIndex == 2
                    ? yearlySpots
                    : dailySpots,
        isCurved: true,
        colors: gradientColors,
        //  gradient: gradient, // Set the defined gradient
        colorStops: gradientStops, // Set the color stops again
        barWidth: 1,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradientFrom:
              const Offset(0.75, 0), // Start gradient at 75% on x-axis (0 to 1)
          gradientTo: const Offset(1.0, 3), // Maintain vertical direction
          colors: [
            Colors.blue.withOpacity(0.1),
            Colors.green.withOpacity(0),
          ],
        ),
      )
    ],
  );
}

List<Color> gradientColors = [
  Colors.blue,
  Colors.green,
  // Colors.blue,
];
final List<double> gradientStops = [
  (10 - 2.5).toDouble() / 10,
  1.0,
];
final LinearGradient gradient = LinearGradient(
  colors: gradientColors,
  stops: gradientStops,
);
