import 'package:cloud_firestore/cloud_firestore.dart';
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
      // companyProfile.date = DateTime.now();

      //creating requirements
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(requirements.identification)
          .set(requirements.toMap());
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
  Future<CompanyRequirementOnSecondryMarketModel> read(String id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<String> update(CompanyRequirementOnSecondryMarketModel requirements) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
