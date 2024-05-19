import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ssen_company/Models/company_profile_model.dart';

import '../Repository/firebase/model methods/firebase_company_profile_methods.dart';

class UserProvider extends ChangeNotifier {
  CompanyProfileModel? _company;
  CompanyProfileModel get getCompany => _company!;

  Future<void> refreshUser() async {
    String id = FirebaseAuth.instance.currentUser!.uid;

    CompanyProfileModel company =
        await FirebaseCompanyProfileMethods().read(id);
    _company = company;
    notifyListeners();
  }
}
