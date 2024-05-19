import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../Models/company_profile_model.dart';
import '../../../Models/secondry_post_share.dart';
import '../../../Models/user_model.dart';
import '../../../utils/date_method.dart';
import '../key words/collection_name.dart';
import '../model abstract/firebase_secondry_post_share_abstract.dart';

class FirebaseSecondryPostShareMethods
    implements FirebaseSecondryPostShareAbstract {
  // @override
  // Future<String> create(CompanyProfileModel companyProfileModel,
  //     SecondryPostShareModel secondryPostShare) async {
  //   String res = "Some error has occured";
  //   secondryPostShare.identification;
  //   secondryPostShare.sellerID;

  //   return res; // error message
  // }

  @override
  Future<String> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String> update(
    SecondryPostShareModel secondryPostShare,
  ) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<String> create(SecondryPostShareModel secondryPostShare,
      UserModel user, CompanyProfileModel company) async {
    String res = "Some error has occured";
    try {
      secondryPostShare.identification = const Uuid().v1();
// secondryPostShare.shareID= shareId;
      secondryPostShare.sellerID = user.identification;
      secondryPostShare.companyID = company.identification;
// secondryPostShare.purchaseID=purchaseId;
      secondryPostShare.date = await DateMethod().getCurrentDateAndTime();

      //creating announcement
      await FirebaseFirestore.instance
          .collection(CollectionName.secondary)
          .doc(secondryPostShare.identification)
          .set(secondryPostShare.toMap());

      //updating user
      List<String> secondaryMarketUpdatedUser = user.secondaryMarket;
      secondaryMarketUpdatedUser.add(secondryPostShare.identification);
      print(CollectionName.user);
      print(user.identification);
      await FirebaseFirestore.instance
          .collection(CollectionName.user)
          .doc(user.identification)
          .update({
        'secondaryMarket': secondaryMarketUpdatedUser,
      });
      //updating company
      List<String> secondaryMarketUpdatedcompany = company.secondaryMarket;
      secondaryMarketUpdatedcompany.add(secondryPostShare.identification);
      // secondaryMarketUpdatedcompany
      //     .removeWhere((String element) => element == "");

      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(company.identification)
          .update({
        'secondaryMarket': secondaryMarketUpdatedcompany,
      });

      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<SecondryPostShareModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.secondary)
          .doc(id)
          .get();

      Map<String, dynamic>? secondaryData = snap.data();
      return SecondryPostShareModel.fromMap(secondaryData!);
    } catch (e) {
      SecondryPostShareModel secondary = SecondryPostShareModel(
          identification: 'Error :${e.toString()}',
          shareID: 'shareID',
          sellerID: 'sellerID',
          purchaseID: 'purchaseID',
          numberOfShare: 00,
          date: DateTime.now().toString(),
          pricePerShare: 0.0);
      return secondary;
    }
  }
}
