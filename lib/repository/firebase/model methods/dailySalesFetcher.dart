import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../../Models/todaySales.dart';
// import '../.Models/todaySales.dart';

class FirebaseTodaySales {
  Future<String> create({
    required String companyID,
    required double primary,
    required double secondary,
  }) async {
    String res = "Some error has occurred";
    try {
      // Get the current date in 'yyyy-MM-dd' format
      // String today = ;

      // Get existing data (if any)
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('DailySales')
          .doc(DateFormat('yyyy-MM-dd').format(DateTime.now()))
          .get();

      // Initialize sales data
      Map<String, dynamic> salesData = {'Sales': []};

      // Check if data exists
      if (docSnapshot.exists) {
        // If data exists, merge the new sales data with existing data
        salesData = docSnapshot.data() as Map<String, dynamic>;

        // Check if 'Sales' list exists
        if (salesData.containsKey('Sales') && salesData['Sales'] is List) {
          List<dynamic> salesList = salesData['Sales'];

          // Check if companyID already exists
          bool companyExists = false;
          for (var i = 0; i < salesList.length; i++) {
            var sale = salesList[i];
            if (sale is String && sale.split(', ')[0] == companyID) {
              // Update primary and secondary values
              var parts = sale.split(', ');
              double oldPrimary = double.parse(parts[1]);
              double oldSecondary = double.parse(parts[2]);
              double newPrimary = oldPrimary + primary;
              double newSecondary = oldSecondary + secondary;
              salesList[i] = "$companyID, $newPrimary, $newSecondary";
              companyExists = true;
              break;
            }
          }

          if (!companyExists) {
            // Add new sales data
            salesData['Sales'].add("$companyID, $primary, $secondary");
          }
        }
      } else {
        // If data doesn't exist, add new sales data
        salesData['Sales'].add("$companyID, $primary, $secondary");
      }

      // Save data to Firestore
      await FirebaseFirestore.instance
          .collection('DailySales')
          .doc(DateFormat('yyyy-MM-dd').format(DateTime.now()))
          .set(salesData);

      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<salesToday> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection('DailySales')
          .doc(id)
          .get();

      Map<String, dynamic>? salesData = snap.data();

      return salesToday.fromMap(salesData!);
    } catch (e) {
      salesToday salesData = salesToday(Sales: e.toString());
      return salesData;
    }
  }
}
