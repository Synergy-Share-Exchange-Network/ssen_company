import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssen_company/repository/firebase/model%20methods/dailySalesFetcher.dart';
import '../../../../Models/ML%20models/ML_general_data_model.dart';
import '../../../../Models/ML%20models/ML_purchase_model.dart';
import '../../../../Models/company_profile_model.dart';
import 'package:intl/intl.dart';
import '../../../../Models/log_model.dart';
import '../../../../Repository/firebase/key%20words/collection_name.dart';
import '../../../../Repository/firebase/model%20abstract/firebase_company_profile_abstract.dart';
import '../../../../Repository/firebase/model%20methods/firebase_log_methods.dart';

class FirebaseCompanyProfileMethods extends FirebaseCompanyProfileAbstract {
  @override
  Future<String> create(CompanyProfileModel companyProfile) async {
    String res = "Some error has occured";
    try {
      companyProfile.isBanned = false;
      companyProfile.isDeleted = false;
      companyProfile.isHidden = false;
      // companyProfile.identification = Uuid().v1();
      // companyProfile.date = DateTime.now();
      MLPurchaseModel mlPurchaseModel = MLPurchaseModel(
          date: [DateFormat('yyyy-MM-dd').format(DateTime.now())],
          seles: ['0']);
      MLPurchaseModel mlSecondaryModel = MLPurchaseModel(
          date: [DateFormat('yyyy-MM-dd').format(DateTime.now())],
          seles: ['0=>0']);
      //creating announcement
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .set(companyProfile.toMap());
      await FirebaseFirestore.instance
          .collection(CollectionName.MLdata)
          .doc(CollectionName.comp)
          .collection(companyProfile.identification)
          .doc(CollectionName.pri)
          .set(mlPurchaseModel.toMap());
      await FirebaseFirestore.instance
          .collection(CollectionName.MLdata)
          .doc(CollectionName.comp)
          .collection(companyProfile.identification)
          .doc(CollectionName.sec)
          .set(mlSecondaryModel.toMap());
      FirebaseTodaySales().create(
          companyID: companyProfile.identification, primary: 0, secondary: 0);

//logging the addition
      // FirebaseLogMethods().create(
      //     companyProfile,
      //     companyProfile.identification,
      //     ModifiedEntity.product,
      //     LogLevel.info,
      //     LogAction.addition,
      //     'reason',
      //     ['']);
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<String> delete(
      String id, String reason, CompanyProfileModel companyProfile) async {
    String res = "";
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(id)
          .get();
      if (docSnapshot.data() != null && docSnapshot.get('isDeleted') == true) {
        res = "alreadyDeleted"; //
      } else {
        // Map();
        await FirebaseFirestore.instance
            .collection(CollectionName.organization)
            .doc(id)
            .update({'isDeleted': true});
        //logging the deletion
        // FirebaseLogMethods().create(companyProfile, id, ModifiedEntity.product,
        //     LogLevel.info, LogAction.deletion, reason, ['']);
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  @override
  Future<CompanyProfileModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(id)
          .get();

      Map<String, dynamic>? companyData = snap.data();

      return CompanyProfileModel.fromMap(companyData!);
    } catch (e) {
      CompanyProfileModel companyModel = CompanyProfileModel(
          identification: 'Error :${e.toString()}',
          name: 'name',
          businessSector: 'businessSector',
          lineOfBusiness: 'lineOfBusiness',
          yearOfEstablishment: 'yearOfEstablishment',
          email: 'email');
      return companyModel;
    }
  }

  @override
  Future<String> update(CompanyProfileModel companyProfileModel) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
