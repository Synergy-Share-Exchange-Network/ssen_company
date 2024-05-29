import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/provider/company_provider.dart';

import '../../Models/company_profile_model.dart';
import '../../repository/api/api_call_prediction.dart';
import '../../utils/helper_function.dart';
import 'graph_generator.dart';

class LineChartgraph extends StatefulWidget {
  // final String title;
  // final List<FlSpot> dailySpots;
  // final List<FlSpot> monthlySpots;
  // final List<FlSpot> yearlySpots;
  // final List<String> xLabelsDay;
  // final List<String> xLabelsMonth;
  // final List<String> xLabelsYear;
  const LineChartgraph({
    Key? key,
    // required this.title,
    // required this.dailySpots,
    // required this.monthlySpots,
    // required this.yearlySpots,
    // required this.xLabelsDay,
    // required this.xLabelsMonth,
    // required this.xLabelsYear,
  }) : super(key: key);

  @override
  _LineChartgraphState createState() => _LineChartgraphState();
}

class _LineChartgraphState extends State<LineChartgraph> {
  // crate list of spots for the graph by monthly, yearly of Google Stocks
  // late List<FlSpot> _daylySpots;
  late List<String> _xLabelsDay;
  late List<String> _xLabelsMonth;
  late List<String> _xLabelsYear;
  late List<List<int>> _monthIndexes;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<FlSpot> _dailySpots = [];
  List<FlSpot> _monthlySpots = [];
  List<FlSpot> _yearlySpots = [];
  int _currentIndex = 0;
  bool _isLoading = true;
  int limit = 10;
  String? id;
  Timer? _dataFetchTimer;
  @override
  void initState() {
    super.initState();
    CompanyProfileModel company =
        Provider.of<UserProvider>(context, listen: false).getCompany;
    id = company.identification;
    // fetchData(id!);
    _dataFetchTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      fetchData(id!);
    });
    // _daylySpots = _generateRandomData();
    _xLabelsDay = _generateXLabelsDay();
    _xLabelsMonth = _generateXLabelsMonth();
    _xLabelsYear = _generateXLabelsYear(2);
  }

  @override
  void dispose() {
    _dataFetchTimer?.cancel();
    super.dispose();
  }

  List<FlSpot> calculateMonthValues(
      List<dynamic> selesData, List<List<int>> monthIndexes) {
    List<FlSpot> monthlySpots = [];

    for (int i = 0; i < monthIndexes.length; i++) {
      List<int> indexes = monthIndexes[i];
      double totalSales = 0;

      for (int j = indexes[0]; j <= indexes[1]; j++) {
        if (selesData[j] is String) {
          totalSales += double.parse(selesData[j]);
        } else {
          totalSales += selesData[j];
        }
      }
    }

    return monthlySpots;
  }

  List<List<int>> calculateMonthIndexes(List<String> dates) {
    List<List<int>> monthIndexes = [];
    int currentYear = -1;
    int currentMonth = -1;
    int monthStartIndex = 0;

    for (int i = 0; i < dates.length; i++) {
      DateTime date = DateTime.parse(dates[i]);
      int year = date.year;
      int month = date.month;

      if (currentYear != year || currentMonth != month) {
        if (currentYear != -1 && currentMonth != -1) {
          // Mark the end index of the previous month
          monthIndexes.add([monthStartIndex, i - 1]);
        }
        // Mark the start index of the current month
        monthStartIndex = i;
      }

      currentYear = year;
      currentMonth = month;
    }

    // Mark the end index of the last month
    monthIndexes.add([monthStartIndex, dates.length - 1]);

    return monthIndexes;
  }

  Future<void> fetchData(String id) async {
    try {
      DocumentSnapshot primaryDoc = await _firestore
          .collection('ML_data')
          .doc('companies')
          .collection(id)
          .doc('primary')
          .get();
      print('1');
      // print(primaryDoc.data());

      if (primaryDoc.exists) {
        Map<String, dynamic>? data = primaryDoc.data() as Map<String, dynamic>?;

        if (data != null) {
          List<dynamic> dates = data['date'] ?? [];
          List<dynamic> seles = data['seles'] ?? [];
          List<double> targetData = [];
          List<List<double>> trainingData =
              []; // Replace with your training data
          for (int i = 0; i < seles.length - 6; i++) {
            List<double> dataPair = [];
            for (int j = i; j < i + 5; j++) {
              if (j < seles.length) {
                dataPair.add(
                    seles[j] is String ? double.parse(seles[j]) : seles[j]);
              } else {
                dataPair.add(0.0); // Add zero if data point is missing
              }
            }
            trainingData.add(dataPair);
            if (trainingData.length > 5) {
              trainingData.removeAt(0);
            }
          }
          List<double> newData =
              []; // Replace with data for tomorrow's prediction
          int targetLength = seles.length < 5 ? 5 : seles.length;
          for (int i = targetLength - 5; i < targetLength; i++) {
            if (i >= 0) {
              targetData.add(
                  seles[i] is String ? double.parse(seles[i - 1]) : seles[i]);
              newData
                  .add(seles[i] is String ? double.parse(seles[i]) : seles[i]);
            } else {
              targetData.add(0.0); // Add zero if data point is missing
            }
          }
          List<double> newtargetData = newData;
          List<List<double>> newtrainingData =
              []; // Replace with your training data
          for (int i = 0; i < seles.length - 5; i++) {
            List<double> dataPair = [];
            for (int j = i; j < i + 5; j++) {
              if (j < seles.length) {
                dataPair.add(
                    seles[j] is String ? double.parse(seles[j]) : seles[j]);
              } else {
                dataPair.add(0.0); // Add zero if data point is missing
              }
            }
            newtrainingData.add(dataPair);
            if (newtrainingData.length > 5) {
              newtrainingData.removeAt(0);
            }
          }
          // Replace with data for tomorrow's prediction
          // int targetLength = seles.length < 5 ? 5 : seles.length;

          print(trainingData);
          print(newtrainingData);
          print(targetData); // Replace with your target data
          print(newtargetData); // Replace with your target data
          print(newData); // Replace with your target data

          Future<String> predictedTomorrowSales = ApiCallPrediction()
              .getPrediction(trainingData, targetData, newData);
          // print(predictedTomorrowSales);
          // Wait for the prediction and store it in tomorrowsales
          var tomorrowSales =
              await predictedTomorrowSales; // Assuming response contains prediction

          print(tomorrowSales);
          double afterTomorrowsales = 10;
          List<double> lastData =
              List.from(newData); // Create a copy of newData

// Remove the first element from the copy
          if (lastData.isNotEmpty) {
            lastData.removeAt(0);
          }
          print(lastData); // Replace with your target data

// Add the value x to the last element of the copy
          lastData.add(52); //!! Don't forget. replace with tomorrow sales
          Future<String> predictedafterTomorrowSales = ApiCallPrediction()
              .getPrediction(newtrainingData, newtargetData, lastData);
          print(predictedafterTomorrowSales);

          double Tomorrowsales = 40;
          _monthIndexes = calculateMonthIndexes(dates.cast<String>());
          print(_monthIndexes);
          List<FlSpot> monthValues = calculateMonthValues(seles, _monthIndexes);
          print(monthValues);

          if (dates.length == seles.length) {
            List<FlSpot> spotsDay = [];
            List<FlSpot> spotsMonth = [];

            int ini = 0;
            for (int i = dates.length - (limit - 2);
                i < dates.length;
                i++, ini++) {
              spotsDay.add(FlSpot(ini.toDouble(), double.parse(seles[i])));
            }
            spotsDay.add(
                FlSpot(spotsDay.length.toDouble(), Tomorrowsales as double));

            // Add after tomorrow's sales (assuming you have a way to get the value)
            spotsDay.add(FlSpot(
                spotsDay.length.toDouble(), afterTomorrowsales as double));

            // for (int i = dates.length; i < dates.length; i++, ini++) {
            //   spotsMonth.add(FlSpot(ini.toDouble(), seles[i].toDouble()));
            // }
            setState(() {
              _dailySpots = spotsDay;
              _monthlySpots = monthValues;

              _isLoading = false;
              print(_dailySpots);
            });
          } else {
            print('Mismatch in length between dates and seles');
          }
        } else {
          print('No data found in primary document.');
        }
      } else {
        print('Primary document does not exist.');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  List<String> _generateXLabelsDay() {
    List<String> labels = [];
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < limit; i++) {
      DateTime date = currentDate.subtract(Duration(days: i - 2));
      String formattedDate = DateFormat('MMM-dd').format(date);
      labels.add(formattedDate);
    }

    print(labels);
    return labels.reversed.toList();
  }

  List<String> _generateXLabelsMonth() {
    List<String> labels = [];
    DateTime currentDate = DateTime.now();

    for (int i = 0; i < 6; i++) {
      DateTime date = currentDate.subtract(
          Duration(days: i * 30)); // Subtracting months instead of days
      String formattedDate =
          DateFormat('MMM-yy').format(date); // Format as month-year
      labels.add(formattedDate);
    }
    print(labels);
    return labels.reversed
        .toList(); // Reversing the list to display from oldest to newest
  }

  List<String> _generateXLabelsYear(int limit) {
    List<String> labels = [];
    DateTime currentDate = DateTime.now();

    for (int i = 0; i < limit; i++) {
      DateTime date = DateTime(currentDate.year - i, 1,
          1); // Create a date for January 1st of the respective year
      String formattedDate = DateFormat('yyyy').format(date); // Format as year
      labels.add(formattedDate);
    }
    print(labels);
    return labels.reversed
        .toList(); // Reversing the list to display from oldest to newest
  }

  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          from: 30,
          child: const Text(
            '+1.5%',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 50),
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          from: 60,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: LineChart(
                mainData(
                  currentIndex: _currentIndex,
                  dailySpots: _dailySpots,
                  monthlySpots: _monthlySpots,
                  yearlySpots: _yearlySpots,
                  xLabelsDay: _xLabelsDay,
                  xLabelsMonth: _xLabelsMonth,
                  xLabelsYear: _xLabelsYear,
                ),
                swapAnimationCurve: Curves.easeInOutCubic,
                swapAnimationDuration: const Duration(milliseconds: 1000),
              )),
        ),
        AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: MediaQuery.of(context).size.height * 0.3,
            padding: const EdgeInsets.all(20),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _currentIndex == 0
                          ? const Color(0xff161b22)
                          : const Color(0xff161b22).withOpacity(0.0),
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
                    duration: const Duration(milliseconds: 500),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _currentIndex == 1
                          ? const Color(0xff161b22)
                          : const Color(0xff161b22).withOpacity(0.0),
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
                    duration: const Duration(milliseconds: 500),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _currentIndex == 2
                          ? const Color(0xff161b22)
                          : const Color(0xff161b22).withOpacity(0.0),
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
}

class CustomToast {
  static void showToast(BuildContext context, String message,
      {Duration duration = const Duration(seconds: 3),
      Color backgroundColor = Colors.black54,
      Color textColor = Colors.white}) {
    final overlay = Overlay.of(context)!;
    final overlayEntry = OverlayEntry(
      builder: (context) => Container(
        padding: const EdgeInsets.all(16.0),
        color: backgroundColor,
        child: Text(
          message,
          style: TextStyle(fontSize: 16.0, color: textColor),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () => overlayEntry.remove());
  }
}
