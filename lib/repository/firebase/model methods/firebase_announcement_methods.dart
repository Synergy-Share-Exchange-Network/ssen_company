import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:ssen_company/Repository/firebase/model%20methods/firebase_company_profile_methods.dart';
import 'package:ssen_company/repository/firebase/firebase_storage_methods.dart';
import 'package:ssen_company/screens/state%20pages/company_profile.dart';
import 'package:uuid/uuid.dart';

import '../../../Models/announcement_model.dart';
import '../../../Models/company_profile_model.dart';
import '../../../Models/log_model.dart';
import '../../../Models/user_model.dart';
import '../key words/collection_name.dart';
import '../model abstract/firebase_announcement_abstract.dart';
import 'firebase_log_methods.dart';

class FirebaseAnnouncementMethods implements FirebaseAnnouncementAbstract {
  @override
  Future<String> create(
      CompanyProfileModel companyProfile,
      AnnouncementModel announcement,
      UserModel user,
      Uint8List? announcmentImage) async {
    String res = "Some error has occured";
    String photoURLWithThumbnails;
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      if (announcmentImage != null) {
        String photoURL = await FirebaseStorageMethods()
            .uploadImageToStorageWithOutCompression(
                "announcement/${auth.currentUser!.uid}/image/${const Uuid().v1()}",
                announcmentImage);
        print(photoURL);
        print(announcmentImage != null);
        if (!kIsWeb) {
          String thumbnailsPhotoURL = await FirebaseStorageMethods()
              .uploadImageToStorageThumbnails(
                  "announcement/${auth.currentUser!.uid}/thumbnail/${const Uuid().v1()}",
                  announcmentImage);
          photoURLWithThumbnails = '$photoURL<thumbnail>$thumbnailsPhotoURL';
        } else {
          photoURLWithThumbnails = '$photoURL<thumbnail>$photoURL';
        }
        announcement.images = [photoURLWithThumbnails];
      }
      announcement.companyID = companyProfile.identification;
      announcement.publishDate = DateTime.now().toString();
      // announcement.postedBy = user.identification;
      announcement.identification = const Uuid().v1();

      //creating announcement
      await FirebaseFirestore.instance
          .collection(CollectionName.announcement)
          .doc(announcement.identification)
          .set(announcement.toMap());
      //updating company
      CompanyProfileModel newCompanyData = await FirebaseCompanyProfileMethods()
          .read(companyProfile.identification);
      List<String>? announcements = newCompanyData.announcementID;
      announcements.insert(0, announcement.identification);
      announcements = announcements
          .where((announcements) => announcements.isNotEmpty)
          .toList();
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .update({'announcementID': announcements});
//logging the addition
      // FirebaseLogMethods().create(
      //     user,
      //     announcement.identification,
      //     ModifiedEntity.announcement,
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

  @override
  Future<String> delete(UserModel user, String id, String reason) async {
    String res = "";
    try {
      // Fetch the document to check current state
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection(CollectionName.announcement)
          .doc(id)
          .get();

      // Check if already deleted
      if (docSnapshot.data() != null && docSnapshot.get('isDeleted') == true) {
        res = "alreadyDeleted"; //
      } else {
        // Update if not already deleted
        await FirebaseFirestore.instance
            .collection(CollectionName.announcement)
            .doc(id)
            .update({
          'isDeleted': true,
        });
        //logging the deletion
        FirebaseLogMethods().create(user, id, 'announcement',
            'info', 'deletion', reason, ['']);

        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  @override
  Future<AnnouncementModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.announcement)
          .doc(id)
          .get();

      Map<String, dynamic>? announcementData = snap.data();

      return AnnouncementModel.fromMap(announcementData!);
    } catch (e) {
      AnnouncementModel announcementModel = AnnouncementModel(
        content: 'Error :${e.toString()}',
      );
      return announcementModel;
    }
  }

  @override
  Future<String> update(CompanyProfileModel companyProfileModel) {
    // TODO: Implement update functionality
    throw UnimplementedError();
  }
}
