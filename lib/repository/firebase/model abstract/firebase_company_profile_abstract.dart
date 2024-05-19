import '../../../Models/company_profile_model.dart';

abstract class FirebaseCompanyProfileAbstract {
  Future<String> create(CompanyProfileModel companyProfile);
  Future<String> delete(
      String id, String reason, CompanyProfileModel companyProfile);
  Future<String> update(CompanyProfileModel companyProfile);
  Future<CompanyProfileModel> read(String id);
}
