import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Models/company_profile_model.dart';
import '../key words/collection_name.dart';
import '../model abstract/firebase_company_profile_abstract.dart';

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

      //creating announcement
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .set(companyProfile.toMap());
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
