import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Models/log_model.dart';
import '../../../Models/user_model.dart';
import '../../../utils/date_method.dart';
import '../key words/collection_name.dart';
import '../model abstract/firebase_user_abstract.dart';
import 'firebase_log_methods.dart';

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
      FirebaseLogMethods().create(
          user,
          user.identification,
          ModifiedEntity.user,
          LogLevel.info,
          LogAction.addition,
          'reason',
          ['']);
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
