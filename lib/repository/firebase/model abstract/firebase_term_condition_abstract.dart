import '../../../Models/company_profile_model.dart';
import '../../../Models/term_condition.dart';

abstract class FirebaseTermConditionAbstract {
  Future<String> create(
      CompanyProfileModel companyProfile, TermConditionModel termCondition);
  Future<String> delete(String id);
  Future<String> update(CompanyProfileModel companyProfileModel);
  Future<TermConditionModel> read(String id);
}
