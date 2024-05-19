import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../Models/purchase_model.dart';
import '../../../Models/share_model.dart';
import '../../../Models/user_model.dart';
import '../key words/collection_name.dart';
import '../model abstract/firebase_purchase_abstract.dart';
// import 'package:u.dart';

class FirebasePurchaseMethods implements FirebasePurchaseAbstract {
  @override
  Future<String> create(
      PurchaseModel purchase, ShareModel share, UserModel user) async {
    String res = "";
    try {
      print("in");
      purchase.identification = const Uuid().v8();
      purchase.companyID = share.companyID;
      purchase.userID = user.identification;
      purchase.firstName = user.firstName;
      purchase.lastName = user.lastName;
      purchase.bankAccount = share.bankInformation[0];
      purchase.houseNumber = user.houseNumber;
      purchase.kebeleIDPhoto = user.kebeleIDPhoto;
      purchase.kebele = user.kebele;
      purchase.nationality = user.nationality;
      purchase.email = user.email;
      purchase.shareID = share.identification;
      purchase.subCity = user.subCity;
      purchase.woreda = user.woreda;
      purchase.phoneNumber = user.phoneNumber;
      purchase.region = user.region;
      // purchase.
      // purchase.deadlineForUnpayedMoney =
      //     share.timeToReturnRemainPayment.toString();
      //creating purchase
      await FirebaseFirestore.instance
          .collection(CollectionName.purchase)
          .doc(purchase.identification)
          .set(purchase.toMap());
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

  @override
  Future<String> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<PurchaseModel> read(String id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<String> update(String id, String attribute, dynamic value) async {
    String res = "";
    try {
      var collection = CollectionName.purchase;

      await FirebaseFirestore.instance.collection(collection).doc(id).update({
        attribute: value,
      });
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
