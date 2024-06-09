import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../../../Models/ML models/ML_purchase_model.dart';
import '../../../../Models/company_profile_model.dart';
import '../../key words/collection_name.dart';

DateFormat formatter = DateFormat('yyyy-MM-dd');

class FirebaseMLshareData {
  Future<MLPurchaseModel> read(String id, bool isPrimary) async {
    try {
      String coll = "";
      if (isPrimary == true) {
        coll = CollectionName.pri;
      } else {
        coll = CollectionName.sec;
      }

      final docRef = FirebaseFirestore.instance
          .collection(CollectionName.MLdata)
          .doc(CollectionName.comp)
          .collection(id)
          .doc(coll);

      final snapshot = await docRef.get();

      if (snapshot.exists) {
        Map<String, dynamic>? userData = snapshot.data();
        return MLPurchaseModel.fromMap(userData!);
      } else {
        // Handle the case where the document doesn't exist
        // You can return a default MLPurchaseModel or throw an exception
        return MLPurchaseModel(date: ['No data found'], seles: ['']);
      }
    } catch (e) {
      MLPurchaseModel p1 =
          MLPurchaseModel(date: ['Error :${e.toString()}'], seles: ['']);
      return p1;
    }
  }

  Future<String> createPrimary(String companyId, int quantity) async {
    String res = "Some error has occured";
    try {
      String dateString = DateFormat('yyyy-MM-dd').format(DateTime.now());
      int currentDaySales = 0;
      MLPurchaseModel p1 = await FirebaseMLshareData().read(companyId, true);
      if (p1.date.length != p1.seles.length) {
        // Handle discrepancy (e.g., throw error or fill missing values)
        return "Error: Inconsistent list lengths"; // Replace with appropriate error handling
      }
      if (p1.seles[0] == '') {
        MLPurchaseModel p2 =
            MLPurchaseModel(date: [dateString], seles: [quantity.toString()]);
        await FirebaseFirestore.instance
            .collection(CollectionName.MLdata)
            .doc(CollectionName.comp)
            .collection(companyId)
            .doc(CollectionName.pri)
            .set(p2.toMap());
      }
      if (p1.seles[0] == '') {
        p1.seles[0] = quantity.toString();
        p1.date[0] = dateString;
      } else {
        DateTime lastDate = DateTime.parse(p1.date.last);
        DateTime dateString2 = DateTime.parse(dateString);
        int dayDifference = dateString2.difference(lastDate).inDays;
        if (dayDifference == 1) {
          p1.date.add(dateString);
          p1.seles.add(((currentDaySales) + quantity).toString());
        } else {
          if (dayDifference != 0) {
            for (var i = 1; i < dayDifference; i++) {
              DateTime addNewDate = lastDate.add(Duration(days: i));
              p1.date.add(DateFormat('yyyy-MM-dd').format(addNewDate));
              p1.seles.add('0');
            }
            p1.date.add(dateString);
            p1.seles.add((int.parse(p1.seles.last) + quantity).toString());
          } else {
            p1.seles.add((int.parse(p1.seles.last) + quantity).toString());
            p1.seles.removeAt(p1.seles.length - 2);
          }
        }
      }
      //update the database entry
      await FirebaseFirestore.instance
          .collection(CollectionName.MLdata)
          .doc(CollectionName.comp)
          .collection(companyId)
          .doc(CollectionName.pri)
          .update(p1.toMap());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> createSecondary(
      String companyId, double price, int newShares) async {
    String res = "Some error has occurred";
    try {
      String dateString = DateFormat('yyyy-MM-dd').format(DateTime.now());

      // Read data and handle potential inconsistencies
      MLPurchaseModel? p1 = await FirebaseMLshareData().read(companyId, false);
      if (p1 == null) {
        // Handle document not found
        print('1');
        return "Error: Data not found for company $companyId";
      }
      if (p1.date.length != p1.seles.length) {
        // Handle inconsistency (e.g., throw exception or fill missing values)
        print('2');
        throw Exception("Error: Inconsistent list lengths in retrieved data");
      }

      if (p1.seles.isEmpty || p1.seles[0] == '') {
        // Initialize with appropriate structure for your use case
        print('3');
        p1 = MLPurchaseModel(
            date: [dateString], seles: ["${newShares}=>$price"]);
      } else {
        print('4');
        DateTime lastDate = DateTime.parse(p1.date.last);
        DateTime todayDate = DateTime.parse(dateString);
        int dayDifference = todayDate.difference(lastDate).inDays;

        if (dayDifference == 1) {
          print('5');
          p1.date.add(dateString);
          p1.seles.add("$newShares=>$price");
        } else if (dayDifference > 1) {
          print('6');
          for (var i = 1; i < dayDifference; i++) {
            DateTime newDate = lastDate.add(Duration(days: i));
            p1.date.add(DateFormat('yyyy-MM-dd').format(newDate));
            p1.seles.add(
                "0=>0"); // Assuming price is needed for missing dates as well
          }
          p1.date.add(dateString);
          p1.seles.add("$newShares=>$price");
        } else {
          print('7');
          bool updated = false;
          for (int i = 0; i < p1.date.length; i++) {
            if (p1.date[i] == dateString) {
              var salePartsList = p1.seles[i].split(',');
              for (int j = 0; j < salePartsList.length; j++) {
                var saleParts = salePartsList[j].split('=>');
                int shares = int.parse(saleParts[0]);
                double existingPrice = double.parse(saleParts[1]);
                if (existingPrice == price) {
                  salePartsList[j] = "${shares + newShares}=>$price";
                  p1.seles[i] = salePartsList.join(',');
                  updated = true;
                  break;
                }
              }
              if (!updated) {
                p1.seles[i] += ",${newShares}=>$price";
                updated = true;
              }
              break;
            }
          }
          if (!updated) {
            p1.date.add(dateString);
            p1.seles.add("$newShares=>$price");
          }
        }
      }

      // Update the database entry
      await FirebaseFirestore.instance
          .collection(CollectionName.MLdata)
          .doc(CollectionName.comp)
          .collection(companyId)
          .doc(CollectionName.sec)
          .update(p1.toMap());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<String> update(CompanyProfileModel companyProfileModel) {
    // TODO: Implement update functionality
    throw UnimplementedError();
  }
}
