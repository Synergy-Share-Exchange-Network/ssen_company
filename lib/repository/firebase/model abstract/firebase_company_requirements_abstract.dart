import '../../../Models/company_requirement_on_secondry_market_model.dart';

abstract class FirebaseCompanyRequirementsAbstract {
  Future<String> create(
      String companyID, CompanyRequirementOnSecondryMarketModel requirements);
  Future<String> delete(String id, String reason);
  Future<String> update(CompanyRequirementOnSecondryMarketModel requirements);
  Future<CompanyRequirementOnSecondryMarketModel> read(String id);
}
