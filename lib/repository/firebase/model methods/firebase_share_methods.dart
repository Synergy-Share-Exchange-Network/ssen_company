import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:ssen_company/Repository/firebase/firebase_storage_methods.dart';
import 'package:uuid/uuid.dart';

import '../../../Models/company_profile_model.dart';
import '../../../Models/share_model.dart';
import '../key words/collection_name.dart';
import '../model abstract/firebase_share_abstract.dart';

class FirebaseShareMethods implements FirebaseShareAbstract {
  @override
  Future<String> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ShareModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.share)
          .doc(id)
          .get();

      Map<String, dynamic>? shareData = snap.data();
      return ShareModel.fromMap(shareData!);
    } catch (e) {
      ShareModel shareModel = ShareModel(
          savingAccountPercentage: 000,
          proclamationNumber: '',
          minimumNumberOfBuyer: 00,
          maximumNumberOfBuyer: 00,
          bankInformation: ['', ''],
          shareImage: ['', ''],
          unitSharePrice: 00,
          noOfShares: 0,
          divident: 00,
          minimumPaymentInPercent: 00,
          minimumNumberOfSharesToBuy: 00,
          maximumNumberOfSharesToBuy: 00);
      return shareModel;
    }
  }

  @override
  Future<String> update(String id, String attribute, dynamic value) async {
    String res = "";
    try {
      var collection = CollectionName.share;

      await FirebaseFirestore.instance.collection(collection).doc(id).update({
        attribute: value,
      });
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  @override
  Future<String> create(ShareModel share, CompanyProfileModel companyProfile,
      List<Uint8List>? images) async {
    String res = "";
    List<String> shareImages = [];
    String imageURL = '';

    try {
      print("in");
      //creating purchase

      share.identification = const Uuid().v8();
      // share.bankInformation = companyProfile.bankAccount;
      share.companyID = companyProfile.identification;
      // share.currency=companyProfile
      share.dateAdded = DateTime.now().toString();
      share.isDeleted = false;
      share.isHidden = false;
      // share.
      // share.noOfShares=companyProfile.

      if (images != null) {
        for (var image in images) {
          // String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
          //     "share/${share.identification}/image/${const Uuid().v4()}",
          //     image);
          // String thumbnailURL = await FirebaseStorageMethods()
          //     .uploadImageToStorageThumbnails(
          //         "share/${share.identification}/thumbnail/${const Uuid().v4()}",
          //         image);
          // String imageURL = "$photoURL<thumbnail>$thumbnailURL";
          // shareImages.add(imageURL);
          if (!kIsWeb) {
            String photoURL = await FirebaseStorageMethods()
                .uploadImageToStorage(
                    "share/${share.identification}/image/${const Uuid().v4()}",
                    image);
            String thumbnailsPhotoURL = await FirebaseStorageMethods()
                .uploadImageToStorageThumbnails(
                    "share/${share.identification}/thumbnail/${const Uuid().v4()}",
                    image);
            imageURL = '$photoURL<thumbnail>$thumbnailsPhotoURL';
          } else {
            String photoURL = await FirebaseStorageMethods()
                .uploadImageToStorageWithOutCompression(
                    "share/${share.identification}/image/${const Uuid().v4()}",
                    image);
            imageURL = '$photoURL<thumbnail>$photoURL';
          }
          shareImages.add(imageURL);

          print(shareImages);
        }
      }
      share.shareImage = shareImages;
      await FirebaseFirestore.instance
          .collection(CollectionName.share)
          .doc(share.identification)
          .set(share.toMap());

      // updating company
      // String? shares = companyProfile.shareID;
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .update({'shareID': share.identification});
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .update({'bankAccount': share.bankInformation});
      // share.insert(0, share.identification);
      // announcements = announcements
      //     .where((announcements) => announcements.isNotEmpty)
      //     .toList();

//logging the addition
      // FirebaseLogMethods().create(
      //     user1,
      //     share.identification,
      //     ModifiedEntity.product,
      //     LogLevel.info,
      //     LogAction.addition,
      //     'reason',
      //     ['']);

      print("out");
//logging the addition
      // FirebaseLogMethods().create(
      //     user1,
      //     companyProfile.identification,
      //     ModifiedEntity.product,
      //     LogLevel.info,
      //     LogAction.addition,
      //     'reason',
      //     ['']);
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
