import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Models/term_condition.dart';
import 'package:ssen_company/Repository/firebase/key%20words/collection_name.dart';
import 'package:ssen_company/Repository/firebase/model%20abstract/firebase_term_condition_abstract.dart';

import 'package:uuid/uuid.dart';

class FirebaseTermConditionMethods implements FirebaseTermConditionAbstract {
  @override
  Future<String> create(CompanyProfileModel companyProfile,
      TermConditionModel termCondition) async {
    String res = "Some error has occured"; // error message
    termCondition.companyId = companyProfile.identification;
    termCondition.identification = const Uuid().v1();
    termCondition.dateAdded = DateTime.now().toString();
    try {
      //creating a terms entry
      await FirebaseFirestore.instance
          .collection(CollectionName.termCondition)
          .doc(termCondition.identification)
          .set(termCondition.toMap());
      //Updating the company with the new terms ID
      List<String>? terms = companyProfile.termconditionID;
      terms.insert(0, termCondition.identification);
      terms = terms.where((terms) => terms.isNotEmpty).toList();
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .update({'termconditionID': terms});
      // FirebaseLogMethods().create(
      //     user1,
      //     termCondition.identification,
      //     ModifiedEntity.product,
      //     LogLevel.info,
      //     LogAction.addition,
      //     "reason",
      //     ['']);
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<String> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String> update(CompanyProfileModel companyProfileModel) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<TermConditionModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.termCondition)
          .doc(id)
          .get();

      Map<String, dynamic>? termsData = snap.data();
      return TermConditionModel.fromMap(termsData!);
    } catch (e) {
      TermConditionModel termCondition =
          TermConditionModel(identification: 'Error :${e.toString()}');
      return termCondition;
    }
  }
}
