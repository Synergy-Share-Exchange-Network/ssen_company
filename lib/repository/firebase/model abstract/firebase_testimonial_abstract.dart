import 'dart:typed_data';

import '../../../Models/company_profile_model.dart';
import '../../../Models/testimonial_model.dart';

abstract class FirebaseTestimonialAbstract {
  Future<String> create(CompanyProfileModel companyProfileModel,
      TestimonialModel testimonial, Uint8List? testimonialImage);
  Future<String> delete(String id);
  Future<String> update(CompanyProfileModel companyProfileModel);
  Future<TestimonialModel> read(String id);
}
