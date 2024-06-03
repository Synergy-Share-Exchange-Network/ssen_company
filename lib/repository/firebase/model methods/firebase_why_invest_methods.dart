import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:ssen_company/Repository/firebase/firebase_storage_methods.dart';
import 'package:uuid/uuid.dart';

import '../../../Models/company_profile_model.dart';
import '../../../Models/why_invest.dart';
import '../key words/collection_name.dart';
import '../model abstract/firebase_why_invest_abstract.dart';

class FirebasewhyInvestMethod implements FirebaseWhyInvestAbstract {
  @override
  Future<String> create(
    CompanyProfileModel companyProfile,
    WhyInvestModel whyInvest,
    Uint8List? whyInvestImage,
  ) async {
    String res = "Some error has occured"; // error message
    whyInvest.companyId = companyProfile.identification;
    whyInvest.dateAdded = DateTime.now().toString();
    whyInvest.identification = const Uuid().v1();
    String photoURLWithThumbnails;
    final FirebaseAuth auth = FirebaseAuth.instance;

    // print("inside function");
    try {
      // if (whyInvestImage != null) {
      //   String photoURL = await FirebaseStorageMethods()
      //       .uploadImageToStorageWithOutCompression(
      //           "whyInvest/${auth.currentUser!.uid}/image/${const Uuid().v1()}",
      //           whyInvestImage);
      //   print(photoURL);
      //   print(whyInvestImage != null);
      //   if (!kIsWeb) {
      //     String thumbnailsPhotoURL = await FirebaseStorageMethods()
      //         .uploadImageToStorageThumbnails(
      //             "whyInvest/${auth.currentUser!.uid}/thumbnail/${const Uuid().v1()}",
      //             whyInvestImage);
      //     photoURLWithThumbnails = '$photoURL<thumbnail>$thumbnailsPhotoURL';
      //   } else {
      //     photoURLWithThumbnails = '$photoURL<thumbnail>$photoURL';
      //   }
      //   whyInvest.image = [photoURLWithThumbnails];
      // }
      // print(whyInvest.image);
      //creating a why invest entry
      await FirebaseFirestore.instance
          .collection(CollectionName.whyInvest)
          .doc(whyInvest.identification)
          .set(whyInvest.toMap());
      //Updating the company with the new Why Invest ID
      List<String> whyInvestID = companyProfile.whyInvestID;
      whyInvestID.insert(0, whyInvest.identification);
      whyInvestID =
          whyInvestID.where((whyInvestID) => whyInvestID.isNotEmpty).toList();
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .update({'whyInvestID': whyInvestID});

      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<String> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String> update(CompanyProfileModel companyProfileModel) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<WhyInvestModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.whyInvest)
          .doc(id)
          .get();

      Map<String, dynamic>? whyInvestData = snap.data();
      return WhyInvestModel.fromMap(whyInvestData!);
    } catch (e) {
      WhyInvestModel whyInvest =
          WhyInvestModel(identification: 'Error :${e.toString()}');
      return whyInvest;
    }
  }
}
