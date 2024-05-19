import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../../../Models/ML models/ML_purchase_model.dart';
import '../../../../Models/company_profile_model.dart';
import '../../key words/collection_name.dart';

class FirebaseMLshareData {
  Future<MLPurchaseModel> read(String id, bool isPrimary) async {
    try {
      String coll = "";
      if (isPrimary == true) {
        coll = CollectionName.pri;
      } else {
        coll = CollectionName.sec;
      }
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.MLdata)
          .doc(CollectionName.comp)
          .collection(id)
          .doc(coll)
          .get();

      Map<String, dynamic>? userData = snap.data();
      return MLPurchaseModel.fromMap(userData!);
    } catch (e) {
      MLPurchaseModel p1 =
          MLPurchaseModel(date: ['Error :${e.toString()}'], seles: ['']);
      return p1;
    }
  }

  Future<String> createPrimary(String companyId) async {
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
        MLPurchaseModel p2 = MLPurchaseModel(date: [dateString], seles: ['1']);
        await FirebaseFirestore.instance
            .collection(CollectionName.MLdata)
            .doc(CollectionName.comp)
            .collection(companyId)
            .doc(CollectionName.pri)
            .set(p2.toMap());
      }
      if (p1.seles[0] == '') {
        p1.seles[0] = '1';
        p1.date[0] = dateString;
      } else {
        DateTime lastDate = DateTime.parse(p1.date.last);
        DateTime dateString2 = DateTime.parse(dateString);
        int dayDifference = dateString2.difference(lastDate).inDays;
        if (dayDifference == 1) {
          p1.date.add(dateString);
          p1.seles.add(((currentDaySales) + 1).toString());
        } else {
          if (dayDifference != 0) {
            for (var i = 1; i < dayDifference; i++) {
              DateTime addNewDate = lastDate.add(Duration(days: i));
              p1.date.add(DateFormat('yyyy-MM-dd').format(addNewDate));
              p1.seles.add('0');
            }
            p1.date.add(dateString);
            p1.seles.add((int.parse(p1.seles.last) + 1).toString());
          } else {
            p1.seles.add((int.parse(p1.seles.last) + 1).toString());
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

  // Future<String> createSecondary(String companyId, String price) async {
  //   String res = "Some error has occured";
  //   try {
  //     String dateString = extractDate(DateTime.now().toString());
  //     MLPurchaseModel p1 = await FirebaseMLsharedata().read(companyId, false);
  //     if (p1.seles[0] == '') {
  //       MLPurchaseModel p2 = MLPurchaseModel(date: [''], seles: ['']);
  //       await FirebaseFirestore.instance
  //           .collection(CollectionName.MLdata)
  //           .doc(CollectionName.comp)
  //           .collection(companyId)
  //           .doc(CollectionName.sec)
  //           .set(p2.toMap());
  //     }
  //     if (p1.seles[0] == '') {
  //       p1.seles[0] = '1';
  //       p1.date[0] = dateString;
  //     } else {
  //       DateTime lastDate = DateTime.parse(p1.date.last);
  //       DateTime dateString2 = DateTime.parse(dateString);
  //       int dayDifference = dateString2.difference(lastDate).inDays;
  //       if (dayDifference == 1) {
  //         p1.date.add(dateString);
  //         p1.seles.add((int.parse(p1.seles.last) + 1).toString());
  //       } else {
  //         if (dayDifference != 0) {
  //           for (var i = 1; i < dayDifference; i++) {
  //             DateTime addNewDate = lastDate.add(Duration(days: i));
  //             p1.date.add(extractDate(addNewDate.toString()));
  //             p1.seles.add('0');
  //           }
  //           p1.date.add(dateString);
  //           p1.seles.add((int.parse(p1.seles.last) + 1).toString());
  //         } else {
  //           p1.seles.add((int.parse(p1.seles.last) + 1).toString());
  //           p1.seles.removeAt(p1.seles.length - 2);
  //         }
  //       }
  //     }
  //     //update the database entry
  //     await FirebaseFirestore.instance
  //         .collection(CollectionName.MLdata)
  //         .doc(CollectionName.comp)
  //         .collection(companyId)
  //         .doc(CollectionName.sec)
  //         .update(p1.toMap());
  //     res = "success";
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   return res;
  // }

  @override
  Future<String> update(CompanyProfileModel companyProfileModel) {
    // TODO: Implement update functionality
    throw UnimplementedError();
  }
}
