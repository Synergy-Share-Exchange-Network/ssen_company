import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssen_company/Models/log_model.dart';
import 'package:ssen_company/Models/user_model.dart';
import 'package:ssen_company/Repository/firebase/key%20words/collection_name.dart';
import 'package:ssen_company/Repository/firebase/model%20abstract/firebase_user_abstract.dart';
import 'package:ssen_company/Repository/firebase/model%20methods/firebase_log_methods.dart';
import 'package:ssen_company/utils/date_method.dart';

class FirebaseUserMethods implements FirebaseUserAbstract {
  @override
  Future<String> create(UserModel user) async {
    String res = "Some error has occured";
    try {
      String date = await DateMethod().getCurrentDateAndTime();
      user.userCreatedDate = date;
      //creating announcement
      await FirebaseFirestore.instance
          .collection(CollectionName.user)
          .doc(user.identification)
          .set(user.toMap());
      // sendEmail(
      //     user.email,
      //     "Welcome!",
      //     // EmailTemplate.companyWelcomeEmail(
      //     //     "Synergy", "Synergyshares@email.com", "wubet ", "Business sector"));
      //     EmailTemplate.getWelcomeEmail(user.firstName, user.email));

//logging the addition
      FirebaseLogMethods().create(user, user.identification, 'user', 'info',
          'addition', 'reason', ['']);
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
  Future<UserModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.user)
          .doc(id)
          .get();

      Map<String, dynamic>? userData = snap.data();
      return UserModel.fromMap(userData!);
    } catch (e) {
      UserModel user = UserModel(
          identification: 'Error :${e.toString()}',
          firstName: 'firstName',
          lastName: 'lastName',
          phoneNumber: 'phoneNumber',
          role: 'user');
      return user;
    }
  }

  @override
  Future<String> update(UserModel companyProfileModel) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
