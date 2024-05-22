import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:ssen_company/Repository/firebase/firebase_storage_methods.dart';
import 'package:uuid/uuid.dart';

import '../../../Models/company_profile_model.dart';
import '../../../Models/company_requirement_on_secondry_market_model.dart';
import '../../../Models/log_model.dart';
import '../../../Models/share_model.dart';
import '../../../Models/user_model.dart';
import '../key words/collection_name.dart';
import '../model methods/firebase_company_profile_methods.dart';
import '../model methods/firebase_company_requirements_methods.dart';
import '../model methods/firebase_log_methods.dart';
import '../model methods/firebase_share_methods.dart';
import '../model methods/firebase_update_methods.dart';

class FirebaseCompanyServiceMethod {
  Future<String> createCompany(CompanyProfileModel company) async {
    String res = "some error has occured";
    try {
      res = await FirebaseCompanyProfileMethods().create(company);
      // res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> verifyOrRejectCompany(CompanyProfileModel company,
      String reason, bool acceptOrDecline, UserModel admin) async {
    String res = "some error has occured";
    //if accepted
    try {
      if (acceptOrDecline) {
        company.isVerified = true;
      } else {
        company.isVerified = false;
      }
      FirebaseUpdateMethodUser().update(admin, company.identification, reason,
          'isVerified', company.isVerified, CompanyProfileModel);
      FirebaseLogMethods().create(
          admin,
          company.identification,
          ModifiedEntity.organizationProfile,
          LogLevel.critical,
          LogAction.modification,
          reason,
          ['']);
      //notify verification througn push notification and email

      res = "Success";
    } catch (e) {
      // TODO
      res = e.toString();
    }

    return res;
  }

  Future<String> addShare(ShareModel share, CompanyProfileModel company) async {
    String res = "some error has occured";
    try {
      // FirebaseShareMethods().create(share, company);
      //if it need to be saved to log think about it roba.
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> addSecondaryMarketRequirement(CompanyProfileModel company,
      CompanyRequirementOnSecondryMarketModel requirement) async {
    String res = "some error has occured";
    try {
      FirebaseCompanyRequirementsMethods()
          .create(company.identification, requirement);
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> editProfile() async {
    String res = "some error has occured";
    try {
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> hideCompany(CompanyProfileModel company, String reason,
      bool toBeHidden, UserModel admin) async {
    String res = "some error has occured";
    try {
      FirebaseUpdateMethodUser().update(admin, company.identification, reason,
          'isHidden', toBeHidden, CompanyProfileModel);
      FirebaseLogMethods().create(
          admin,
          company.identification,
          ModifiedEntity.organizationProfile,
          LogLevel.critical,
          LogAction.modification,
          reason,
          ['']);
      //notify verification througn push notification and email
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> banCompany(CompanyProfileModel company, String reason,
      bool toBeBanned, UserModel admin) async {
    String res = "some error has occured";
    try {
      FirebaseUpdateMethodUser().update(admin, company.identification, reason,
          'isBanned', toBeBanned, CompanyProfileModel);
      FirebaseLogMethods().create(
          admin,
          company.identification,
          ModifiedEntity.organizationProfile,
          LogLevel.critical,
          LogAction.modification,
          reason,
          ['']);
      //notify verification througn push notification and email
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> updateCompanyLOgo(
      {required Uint8List file,
      required String companyId,
      required List<String> logo}) async {
    String res = "some error has occured";
    String photoURLWithThumbnails = "";
    List<String> finalLogo = [''];

    try {
      if (file != null) {
        String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
            "logo/${companyId}/image/${const Uuid().v1()}", file);
        if (!kIsWeb) {
          String thumbnailsPhotoURL = await FirebaseStorageMethods()
              .uploadImageToStorageThumbnails(
                  "logo/$companyId/thumbnail/${const Uuid().v1()}", file);
          photoURLWithThumbnails = '$photoURL<thumbnail>$thumbnailsPhotoURL';
        } else {
          photoURLWithThumbnails = '$photoURL<thumbnail>$photoURL';
        }
        logo.insert(0, photoURLWithThumbnails);
        logo.removeWhere((string) => string == "");

        await FirebaseFirestore.instance
            .collection(CollectionName.organization)
            .doc(companyId)
            .update({
          'logoImage': logo,
        });

        // company.logoImage = [photoURLWithThumbnails];
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> updateBrandImage(
      {required Uint8List file,
      required String companyId,
      required List<String> brandImage}) async {
    String res = "some error has occured";
    String photoURLWithThumbnails = "";
    List<String> finalLogo = [''];

    try {
      if (file != null) {
        String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
            "logo/${companyId}/image/${const Uuid().v1()}", file);
        if (!kIsWeb) {
          String thumbnailsPhotoURL = await FirebaseStorageMethods()
              .uploadImageToStorageThumbnails(
                  "logo/$companyId/thumbnail/${const Uuid().v1()}", file);
          photoURLWithThumbnails = '$photoURL<thumbnail>$thumbnailsPhotoURL';
        } else {
          photoURLWithThumbnails = '$photoURL<thumbnail>$photoURL';
        }
        brandImage.insert(0, photoURLWithThumbnails);
        brandImage.removeWhere((string) => string == "");

        await FirebaseFirestore.instance
            .collection(CollectionName.organization)
            .doc(companyId)
            .update({
          'brandImage': brandImage,
        });

        // company.logoImage = [photoURLWithThumbnails];
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
