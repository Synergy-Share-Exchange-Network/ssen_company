import 'dart:typed_data';

import '../../../Models/company_profile_model.dart';
import '../../../Models/why_invest.dart';

abstract class FirebaseWhyInvestAbstract {
  Future<String> create(
    CompanyProfileModel companyProfile,
    WhyInvestModel whyInvest,
    Uint8List? whyInvestImage,
  );
  Future<String> delete(String id);
  Future<String> update(CompanyProfileModel companyProfileModel);
  Future<WhyInvestModel> read(String id);
}
