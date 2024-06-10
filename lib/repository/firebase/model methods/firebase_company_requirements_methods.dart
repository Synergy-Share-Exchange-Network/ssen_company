import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Models/user_model.dart';
import 'package:ssen_company/repository/firebase/model%20methods/firebase_update_methods.dart';
import 'package:uuid/uuid.dart';

import '../../../Models/company_requirement_on_secondry_market_model.dart';
import '../key words/collection_name.dart';
import '../model abstract/firebase_company_requirements_abstract.dart';

// import '../key words/collection_name.dart';

class FirebaseCompanyRequirementsMethods
    implements FirebaseCompanyRequirementsAbstract {
  @override
  Future<String> create(String companyID,
      CompanyRequirementOnSecondryMarketModel requirements) async {
    String res = "Some error has occured";
    try {
      requirements.isDeleted = false;
      requirements.identification = const Uuid().v1();
      requirements.companyId = companyID;
      // companyProfile.date = DateTime.now();

      //creating requirements
      await FirebaseFirestore.instance
          .collection(CollectionName.companySecondaryReq)
          .doc(requirements.identification)
          .set(requirements.toMap());
      UserModel user = UserModel(
          firstName: 'firstName',
          lastName: 'lastName',
          phoneNumber: 'phoneNumber',
          identification: 'ID');
      await FirebaseUpdateMethodUser().update(user, companyID, 'reason',
          'userRequirment', requirements.identification, CompanyProfileModel);
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<String> delete(String id, String reason) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<CompanyRequirementOnSecondryMarketModel> read(String id) async {
    String res = "Some error has occured";
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.companySecondaryReq)
          .doc(id)
          .get();

      Map<String, dynamic>? reqirements = snap.data();

      return CompanyRequirementOnSecondryMarketModel.fromMap(reqirements!);
    } catch (e) {
      CompanyRequirementOnSecondryMarketModel companyModel =
          CompanyRequirementOnSecondryMarketModel(
        identification: 'Error :${e.toString()}',
      );
      return companyModel;
    }
  }

  @override
  Future<String> update(
      CompanyRequirementOnSecondryMarketModel requirements) async {
    String res = "Some error has occured";
    try {
      requirements.isDeleted = false;
      // requirements.identification = const Uuid().v1();
      // companyProfile.date = DateTime.now();

      //creating requirements
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(requirements.identification)
          .update(requirements.toMap());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
