import '../../../Models/search_model.dart';

abstract class FirebaseSearchAbstract {
  // Future<String> create(CompanyProfileModel companyProfileModel);
  // Future<String> delete(String id);
  // Future<String> update(CompanyProfileModel companyProfileModel);
  Future<SearchModel> read();
}
