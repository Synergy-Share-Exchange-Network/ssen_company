import '../../../Models/company_profile_model.dart';
import '../../../Models/faq_model.dart';

abstract class FirebaseFaqAbstract {
  Future<String> create(CompanyProfileModel companyProfile, FaqModel faqModel);
  Future<String> delete(String id, CompanyProfileModel companyProfile);
  Future<String> update(FaqModel faqModel);
  Future<FaqModel> read(String id);
}
