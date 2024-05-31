import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../../../../Models/ML models/ML_general_attribute_model.dart';
import '../../../../Models/ML models/ML_general_data_model.dart';
import '../../../../Models/ML models/ML_purchase_model.dart';
import '../../key words/collection_name.dart';

// import 'package:ssen_backend_test/utils/date_method.dart';

class FirebaseGeneralDataAttribute {
  Future<MLGeneralAttributeModel> readAtt() async {
    try {
      // final snap = await FirebaseFirestore.instance
      //     .collection(CollectionName.user)
      //     .doc(id)
      //     .get();
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.MLdata)
          .doc(CollectionName.general)
          .collection(CollectionName.general)
          .doc(CollectionName.general)
          .get();

      Map<String, dynamic>? userData = snap.data();
      return MLGeneralAttributeModel.fromMap(userData!);
    } catch (e) {
      MLGeneralAttributeModel user = MLGeneralAttributeModel();
      return user;
    }
  }

  Future<MLPurchaseModel> readPri(String id) async {
    try {
      // final snap = await FirebaseFirestore.instance
      //     .collection(CollectionName.user)
      //     .doc(id)
      //     .get();
      final snap = await FirebaseFirestore.instance
          .collection('ML_data')
          .doc('companies')
          .collection(id)
          .doc('primary')
          .get();

      Map<String, dynamic>? userData = snap.data();
      return MLPurchaseModel.fromMap(userData!);
    } catch (e) {
      MLPurchaseModel user = MLPurchaseModel(date: [e.toString()], seles: []);
      return user;
    }
  }

  Future<MLGeneralDataModel> read() async {
    try {
      // final snap = await FirebaseFirestore.instance
      //     .collection(CollectionName.user)
      //     .doc(id)
      //     .get();
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.MLdata)
          .doc(CollectionName.general)
          .collection(CollectionName.data)
          .doc(CollectionName.data)
          .get();

      Map<String, dynamic>? userData = snap.data();
      return MLGeneralDataModel.fromMap(userData!);
    } catch (e) {
      MLGeneralDataModel user = MLGeneralDataModel(data: [e.toString()]);
      return user;
    }
  }
  // ! Handles data attribute creation in FirebaseFirestore

  Future<String> createDataAttribute(
      MLGeneralAttributeModel mlattributemodel) async {
    String res = "Some error has occured";
    try {
      // ! Check document existence for efficient updates/creation
      final docRef = FirebaseFirestore.instance
          .collection(CollectionName.MLdata)
          .doc(CollectionName.general)
          .collection(CollectionName.data)
          .doc(CollectionName.data);
      final snapshot = await docRef.get();

      // * Extract data from model
      final double gdp = mlattributemodel.GDP;
      final double famines = mlattributemodel.famines;
      final double globalEconomy = mlattributemodel.globalEconomy;
      final double inflation = mlattributemodel.inflation;
      final double naturalDisaster = mlattributemodel.naturalDisaster;
      final double politicalStablity = mlattributemodel.politicalStablity;
      final double rumoursOnShareMarket = mlattributemodel.rumoursOnShareMarket;
      final double unemploymentRate = mlattributemodel.unemploymentRate;

      // * Construct formatted data string
      final formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final formattedString =
          "$formattedDate,$gdp,$famines,$globalEconomy,$inflation,$naturalDisaster,$politicalStablity,$rumoursOnShareMarket,$unemploymentRate";

      final List<String> existingData = [];
      if (snapshot.exists) {
        existingData.addAll((snapshot.data()!["data"] ?? [])
            ?.cast<String>()); // Handle potential null data
      }

      if (existingData.isEmpty) {
        // ! Create a new document
        await docRef.set({
          "data": [formattedString],
        });
        res = "Created successfully";
      } else {
        // * Check if first entry matches (assuming data format consistency)
        final lastEntryDate =
            DateTime.parse(existingData.last.split(',').first);
        final difference =
            lastEntryDate.difference(DateTime.now()).inDays.abs();
        if (difference == 0) {
          // ! Update today's entry (last element)
          existingData[existingData.length - 1] =
              formattedString; // Update last element
          await docRef.update({
            "data": existingData,
          });
          res = "Updated successfully (updated today's entry)";
        } else if (difference > 0) {
          // * Calculate and add missing entries (handle potential gaps)
          final List<String> missingEntries = [];
          for (DateTime potentialMissingDate =
                  lastEntryDate.add(const Duration(days: 1));
              potentialMissingDate
                  .isBefore(DateTime.now().add(const Duration(days: 0)));
              potentialMissingDate =
                  potentialMissingDate.add(const Duration(days: 1))) {
            bool found = false;
            for (final existingEntry in existingData) {
              if (existingEntry.split(',').first ==
                  DateFormat('yyyy-MM-dd').format(potentialMissingDate)) {
                found = true;
                break;
              }
            }
            if (!found) {
              final missingDateString =
                  DateFormat('yyyy-MM-dd').format(potentialMissingDate);
              final missingEntry =
                  "$missingDateString,$gdp,$famines,$globalEconomy,$inflation,$naturalDisaster,$politicalStablity,$rumoursOnShareMarket,$unemploymentRate";
              missingEntries.add(missingEntry);
            }
          }

          // ! Add entries for all missing dates in a single update
          if (missingEntries.isNotEmpty) {
            await docRef.update({
              "data": [...existingData, ...missingEntries],
            });
            res = "Updated successfully (added missing entries)";
          } else {
            res = "No missing entries found"; // Informative message
          }
        } else {
          // ! Handle potential errors (date in the future)
          print('Error: Date seems to be in the future');
        }
      }
    } catch (err) {
      print(
          'Error creating data attribute: $err'); // More specific error message
      res = err.toString();
    }
    return res;
  }

  // ! Utility function to calculate missing dates

  List<DateTime> calculateMissingDates(DateTime startDate, DateTime endDate) {
    final List<DateTime> missingDates = [];
    for (int i = 0;
        startDate.isBefore(endDate.add(const Duration(days: 1)));
        i++) {
      missingDates.add(startDate.add(Duration(days: i)));
    }
    return missingDates;
  }
}
