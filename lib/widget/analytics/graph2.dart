import 'dart:async';
import 'dart:math'; // Import for double.parse

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../Models/company_profile_model.dart';
import '../../provider/company_provider.dart';

class PercentIndicator extends StatefulWidget {
  const PercentIndicator({Key? key}) : super(key: key);

  @override
  _PercentIndicatorState createState() => _PercentIndicatorState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<double> fetchData(String id) async {
  try {
    DocumentSnapshot primaryDoc = await _firestore
        .collection('ML_data')
        .doc('companies')
        .collection(id)
        .doc('primary')
        .get();
    print('1');

    if (primaryDoc.exists) {
      Map<String, dynamic>? data = primaryDoc.data() as Map<String, dynamic>?;
      if (data != null) {
        List<dynamic> dates = data['date'] ?? [];
        List<dynamic> seles = data['seles'] ?? [];
        if (dates.length == seles.length) {
          double totalSales = 0.0;
          for (var element in seles) {
            totalSales += double.parse(
                element.toString()); // Handle potential non-String numerics
          }
          return totalSales;
        } else {
          print('Mismatch in length between dates and seles');
          return 0.0; // Or handle mismatch differently (e.g., throw exception)
        }
      } else {
        print('No data found in primary document.');
        return 0.0;
      }
    } else {
      print('Primary document does not exist.');
      return 0.0;
    }
  } catch (e) {
    print('Error fetching data: $e');
    return 0.0; // Or handle error differently (e.g., throw exception)
  }
}

class _PercentIndicatorState extends State<PercentIndicator> {
  String? id;
  double totalSales = 0.0;
  double shareQuant = 0.0;

  @override
  void initState() {
    super.initState();
    CompanyProfileModel company =
        Provider.of<UserProvider>(context, listen: false).getCompany;
    id = company.identification;
    // id = 'NKkRUGqVFDUYi6qTMWrhOlctHmT2';

    fetchData(id!).then((value) {
      setState(() {
        totalSales = value;
        shareQuant = 6000; //! replace with no of shares
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double parsedTotal = double.parse(totalSales.toString()) / shareQuant;
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPercentIndicator(
              animation: true,
              animationDuration: 1000,
              radius: 130,
              lineWidth: 50,
              percent: parsedTotal,
              progressColor: Colors.lightBlue,
              backgroundColor: Colors.lightBlue.shade200,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                '${(parsedTotal * 100).toStringAsFixed(1)}%',
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
              animationDuration: 1000,
              lineHeight: 30,
              percent: parsedTotal,
              progressColor: Colors.lightBlue,
              backgroundColor: Colors.lightBlue.shade200,
            )
          ],
        ),
      ),
    );
  }
}
