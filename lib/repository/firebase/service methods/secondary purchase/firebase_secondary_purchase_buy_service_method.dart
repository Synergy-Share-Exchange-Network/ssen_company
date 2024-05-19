import '../../../../Models/purchase_model.dart';
import '../../../../Models/secondry_post_share.dart';
import '../../../../Models/share_model.dart';
import '../../../../Models/user_model.dart';
import '../../../../utils/date_method.dart';
import '../../model methods/firebase_purchase_methods.dart';

class FirebaseSecondaryPurchaseBuyServiceMethod {
  Future<String> createSecondaryMarketBuy(SecondryPostShareModel secondary,
      ShareModel share, UserModel user, PurchaseModel purchase) async {
    String res = "some error has occured";
    try {
      //Creates secondary buy request
      String date = await DateMethod().getCurrentDateAndTime();
      purchase.shareID = share.identification;
      purchase.secondaryId = secondary.identification;
      purchase.isSecondary = true;
      purchase.requestSent = [
        'true',
        date,
      ];
      //update purchase information to the database
      purchase.pendingPayment = ['secondary'];
      purchase.acceptedPayment = ['secondary'];
      // FirebasePurchaseMethods()
      //     .update(purchase.identification, 'requestSent', purchase.requestSent);
      // FirebasePurchaseMethods().update(
      //     purchase.identification, 'pendingPayment', purchase.pendingPayment);
      // FirebasePurchaseMethods().update(
      //     purchase.identification, 'acceptedPayment', purchase.acceptedPayment);
      // FirebasePurchaseMethods()
      //     .update(purchase.identification, 'isSecondary', purchase.isSecondary);
      FirebasePurchaseMethods().create(purchase, share, user);

      //Asks verification by calling verifyCompany()
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  // Future<String> verifyRequest(SecondryPostShareModel secondary) async {
  //   String res = "some error has occured";
  //   try {
  //     String date = await DateMethod().getCurrentDateAndTime();
  //     res = "Success";
  //   } catch (e) {
  //     res = e.toString();
  //   }
  //   //save purchase information to the database

  //   return res;
  // }

  Future<String> requestDeclineAcceptance(
      PurchaseModel purchase, String reason, bool acceptOrDecline) async {
    //ACCEPT DECLINE REQUEST
    String res = "some error has occured";
    try {
      String date = await DateMethod().getCurrentDateAndTime();
      if (acceptOrDecline) {
        purchase.requestAccepted = [
          'true',
          date,
        ];
      } else {
        purchase.requestAccepted = ['false', date, reason];
      }
      //notify purchase
      //if decline

      //update purchase information to the database
      FirebasePurchaseMethods().update(
          purchase.identification, 'requestAccepted', purchase.requestAccepted);
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    //save purchase information to the database

    return res;
  }

  Future<String> generateInvoice(SecondryPostShareModel secondary) async {
    // GENERATE PDF
    String res = "some error has occured";
    try {
      String date = await DateMethod().getCurrentDateAndTime();
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    //save purchase information to the database

    return res;
  }

  Future<String> confirmTransaction(
      PurchaseModel purchase, bool iscomplited, String reason) async {
    String res = "some error has occured";
    try {
      String date = await DateMethod().getCurrentDateAndTime();
      if (iscomplited) {
        purchase.successfullyBought = [
          'true',
          date,
        ];
      } else {
        purchase.successfullyBought = ['false', date, reason];
      }
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    //save purchase information to the database

    return res;
  }
}
