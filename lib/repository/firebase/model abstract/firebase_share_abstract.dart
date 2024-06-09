import 'dart:typed_data';

import '../../../Models/company_profile_model.dart';
import '../../../Models/share_model.dart';

abstract class FirebaseShareAbstract {
  Future<String> create(ShareModel share, CompanyProfileModel companyProfile,
      List<Uint8List>? images);
  Future<String> delete(String id);
  Future<String> update(String id, String attribute, dynamic value);
  Future<ShareModel> read(String id);
}
