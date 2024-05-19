import '../../../Models/announcement_model.dart';
import '../../../Models/company_profile_model.dart';
import '../../../Models/user_model.dart';

abstract class FirebaseAnnouncementAbstract {
  Future<String> create(CompanyProfileModel companyProfileModel,
      AnnouncementModel announcement, UserModel user);
  Future<String> delete(UserModel user, String id, String reason);
  Future<String> update(CompanyProfileModel companyProfileModel);
  Future<AnnouncementModel> read(String id);
}
