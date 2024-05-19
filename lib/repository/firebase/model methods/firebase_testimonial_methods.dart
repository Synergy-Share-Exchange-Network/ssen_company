import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../Models/company_profile_model.dart';
import '../../../Models/testimonial_model.dart';
import '../key words/collection_name.dart';
import '../model abstract/firebase_testimonial_abstract.dart';

class FirebaseTestimonialMethods implements FirebaseTestimonialAbstract {
  @override
  Future<String> create(
      CompanyProfileModel companyProfile, TestimonialModel testimonial) async {
    String res = "Some error has occured"; // error message
    testimonial.companyId = companyProfile.identification;
    testimonial.identification = const Uuid().v1();
    try {
      //creating a testimonial entry
      await FirebaseFirestore.instance
          .collection(CollectionName.testimonial)
          .doc(testimonial.identification)
          .set(testimonial.toMap());
      //Updating the company with the new FAQ ID
      List<String>? testimonialID = companyProfile.testimonialID;
      testimonialID.insert(0, testimonial.identification);
      testimonialID = testimonialID
          .where((testimonialID) => testimonialID.isNotEmpty)
          .toList();
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .update({'TestimonialID': testimonialID});
      // FirebaseLogMethods().create(
      //     user1,
      //     testimonial.identification,
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
  Future<TestimonialModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.testimonial)
          .doc(id)
          .get();

      Map<String, dynamic>? testimonialData = snap.data();
      return TestimonialModel.fromMap(testimonialData!);
    } catch (e) {
      TestimonialModel testimonial = TestimonialModel(
          identification: 'Error :${e.toString()}',
          name: 'name',
          position: 'position',
          testimony: 'testimony');
      return testimonial;
    }
  }
}
