import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../../../../Models/company_profile_model.dart';
import '../../../../Models/user_model.dart';
import '../../firebase_storage_methods.dart';
import '../../model methods/firebase_company_profile_methods.dart';
import '../../model methods/firebase_user_methods.dart';

class AuthMethods {
  Future<String> signUpUser({
    required UserModel user,
    required String password,
    Uint8List? file,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String res = "some error has occured";
    String photoURLWithThumbnails;
    try {
      if (user.firstName.isNotEmpty ||
          user.lastName.isNotEmpty ||
          password.isNotEmpty ||
          user.email.isNotEmpty) {
        print("object");
        // register user
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: user.email, password: password);
        print(cred.user!.uid);
        if (file != null) {
          String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
              "profile pics/${auth.currentUser!.uid}/image/${const Uuid().v1()}",
              file);
          if (!kIsWeb) {
            String thumbnailsPhotoURL = await FirebaseStorageMethods()
                .uploadImageToStorageThumbnails(
                    "profile pics/${auth.currentUser!.uid}/thumbnail/${const Uuid().v1()}",
                    file);
            photoURLWithThumbnails = '$photoURL<thumbnail>$thumbnailsPhotoURL';
          } else {
            photoURLWithThumbnails = '$photoURL<thumbnail>$photoURL';
          }
          user.profilePicture = [photoURLWithThumbnails];
        }
        user.userCreatedDate = DateTime.now().toString().substring(0, 10);
        user.identification = cred.user!.uid;

        await FirebaseUserMethods().create(user);
        print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
        print(user);
        print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> signUp({
    required UserModel user,
    required String password,
    // required Uint8List file,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String res = "some error has occured";
    try {
      if (user.firstName.isNotEmpty ||
              user.lastName.isNotEmpty ||
              password.isNotEmpty ||
              user.email.isNotEmpty
          // ||
          // file != null
          ) {
        // register user
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: user.email, password: password);
        print(cred.user!.uid);

        // String photoURL = await FirebaseStorageMethods()
        //     .uploadImageToStorageWithoutCompression(
        //         "profile pics/${_auth.currentUser!.uid}/image/${const Uuid().v1()}",
        //         file);
        // String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
        //     "profile pics/${_auth.currentUser!.uid}/image/${const Uuid().v1()}",
        //     file);

        // String thumbnailsPhotoURL = await FirebaseStorageMethods()
        //     .uploadImageToStorageThumbnails(
        //         "profile pics/${_auth.currentUser!.uid}/thumbnail/${const Uuid().v1()}",
        //         file);

        // String photoURLWithThumbnails =
        //     '$photoURL<thumbnail>$thumbnailsPhotoURL';
        // user.profilePicture = [photoURLWithThumbnails];
        // user.profilePicture = [photoURL];
        // user.userCreatedDate = DateTime.now().toString().substring(0, 10);
        user.identification = cred.user!.uid;

        await FirebaseUserMethods().create(user);

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> signUpCompany({
    required CompanyProfileModel company,
    required String password,
    Uint8List? logo,
    Uint8List? tradeLicense,
    Uint8List? shareLicense,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String photoURLWithThumbnails;
    String photoURLWithThumbnails2;
    String photoURLWithThumbnails3;

    String res = "some error has occured";
    try {
      if (company.name.isNotEmpty ||
          company.email.isNotEmpty ||
          password.isNotEmpty ||
          company.phoneNumber.isNotEmpty) {
        // register user
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: company.email, password: password);
        print(cred.user!.uid);
        print(logo != null);
        print(shareLicense != null);
        print(tradeLicense != null);

        if (logo != null) {
          String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
              "logo/${auth.currentUser!.uid}/image/${const Uuid().v1()}", logo);
          if (!kIsWeb) {
            String thumbnailsPhotoURL = await FirebaseStorageMethods()
                .uploadImageToStorageThumbnails(
                    "logo/${auth.currentUser!.uid}/thumbnail/${const Uuid().v1()}",
                    logo);
            photoURLWithThumbnails = '$photoURL<thumbnail>$thumbnailsPhotoURL';
          } else {
            photoURLWithThumbnails = '$photoURL<thumbnail>$photoURL';
          }
          company.logoImage = [photoURLWithThumbnails];
        }
        if (shareLicense != null) {
          String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
              "shareLicense/${auth.currentUser!.uid}/image/${const Uuid().v1()}",
              shareLicense);
          if (!kIsWeb) {
            String thumbnailsPhotoURL = await FirebaseStorageMethods()
                .uploadImageToStorageThumbnails(
                    "logo/${auth.currentUser!.uid}/thumbnail/${const Uuid().v1()}",
                    shareLicense);
            photoURLWithThumbnails2 = '$photoURL<thumbnail>$thumbnailsPhotoURL';
          } else {
            photoURLWithThumbnails2 = '$photoURL<thumbnail>$photoURL';
          }
          company.shareSalesLicense = [photoURLWithThumbnails2];
        }
        if (tradeLicense != null) {
          String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
              "tradeLicense/${auth.currentUser!.uid}/image/${const Uuid().v1()}",
              tradeLicense);
          if (!kIsWeb) {
            String thumbnailsPhotoURL = await FirebaseStorageMethods()
                .uploadImageToStorageThumbnails(
                    "logo/${auth.currentUser!.uid}/thumbnail/${const Uuid().v1()}",
                    tradeLicense);
            photoURLWithThumbnails3 = '$photoURL<thumbnail>$thumbnailsPhotoURL';
          } else {
            photoURLWithThumbnails3 = '$photoURL<thumbnail>$photoURL';
          }
          company.tradeLicense = [photoURLWithThumbnails3];
        }
        company.identification = cred.user!.uid;
        company.createdDay = DateTime.now().toString();
        print("ccccccccccccccccccccccccccccccccccccccccccccccccccccc");
        print(company);
        await FirebaseCompanyProfileMethods().create(company);
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error has occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        res = "Success";
      } else {
        res = "Please Enter All Fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> logoutUser() async {
    String res = "Some error has occured";
    try {
      await FirebaseAuth.instance.signOut();
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future resetPassword(String email) async {
    // UserModel user = await getUserDetail();
    String res = "Some error has occured";
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future verifyEmail(String email) async {
    // UserModel user = await getUserDetail();
    String res = "Some error has occured";
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
