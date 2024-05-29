import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../Models/company_profile_model.dart';
import '../../../Models/faq_model.dart';
import '../key words/collection_name.dart';
import '../model abstract/firebase_faq_abstract.dart';

class FirebaseFaqMethod implements FirebaseFaqAbstract {
  @override
  Future<String> create(
      CompanyProfileModel companyProfile, FaqModel faqModel) async {
    String res = "Some error has occured"; // error message
    faqModel.companyId = companyProfile.identification;
    // faqModel.description = "";
    // faqModel.title = "";
    faqModel.identification = const Uuid().v1();
    try {
      //creating an FAQ entry
      await FirebaseFirestore.instance
          .collection(CollectionName.faq)
          .doc(faqModel.identification)
          .set(faqModel.toMap());
      //Updating the company with the new FAQ ID
      List<String>? faq = companyProfile.faqID;
      faq.insert(0, faqModel.identification);
      faq = faq.where((faq) => faq.isNotEmpty).toList();
      faq.removeWhere((string) => string == '');

      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .update({'faqID': faq});
      // FirebaseLogMethods().create(
      //     companyProfile,
      //     faqModel.identification,
      //     ModifiedEntity.organizationProfile,
      //     LogLevel.info,
      //     LogAction.addition,
      //     "no reason needed",
      //     ['']);
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<String> delete(String id, CompanyProfileModel companyProfile) async {
    String res = "";
    try {
      // Fetch the document to check current state
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection(CollectionName.faq)
          .doc(id)
          .get();

      // Check if already deleted
      if (docSnapshot.data() != null && docSnapshot.get('isDeleted') == true) {
        res = "alreadyDeleted"; //
      } else {
        // Update if not already deleted
        await FirebaseFirestore.instance
            .collection(CollectionName.announcement)
            .doc(id)
            .update({
          'isDeleted': true,
        });
        //logging the deletion
        // FirebaseLogMethods().create(
        //     companyProfile,
        //     id,
        //     ModifiedEntity.organizationProfile,
        //     LogLevel.info,
        //     LogAction.deletion,
        //     "reason",
        //     ['']);

        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  @override
  Future<FaqModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.faq)
          .doc(id)
          .get();

      Map<String, dynamic>? FAQData = snap.data();

      return FaqModel.fromMap(FAQData!);
    } catch (e) {
      FaqModel faqModel = FaqModel(identification: 'Error :${e.toString()}');
      return faqModel;
    }
  }

  @override
  Future<String> update(FaqModel faqModel) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
