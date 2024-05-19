import '../../../Models/purchase_model.dart';
import '../../../Models/share_model.dart';
import '../../../Models/user_model.dart';
import '../../../utils/date_method.dart';
import '../model methods/firebase_purchase_methods.dart';

class FirebasePurchaseServiceMethod {
  // Future<String> createPurchase({
  //   required UserModel user,
  //   required ShareModel share,
  //   required String date,
  // }) async {
  //   String res = "some error has occured";
  //   try {
  //     //Implementation
  //     res = "success";
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   return res;
  // }

  // Future<String> sendRequest({
  //   required UserModel user,
  //   required ShareModel share,
  //   required String date,
  // }) async {
  //   String res = "some error has occured";
  //   try {
  //     //Implementation
  //     res = "success";
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   return res;
  // }

  Future<String> createPurchase(
      PurchaseModel purchase, ShareModel share, UserModel user) async {
    String res = "some error has occured";
    try {
      FirebasePurchaseMethods().create(purchase, share, user);
      String date = await DateMethod().getCurrentDateAndTime();
      purchase.requestSent = [
        'true',
        date,
      ];
      //update purchase information to the database
      FirebasePurchaseMethods()
          .update(purchase.identification, 'requestSent', purchase.requestSent);
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    //save purchase information to the database

    return res;
  }

  Future<String> acceptOrDeclinePurchase(
      PurchaseModel purchase, String reason, bool acceptOrDecline) async {
    String res = "some error has occured";
    //if accepted
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
      notifyPurchase(purchase);
      res = "Success";
    } catch (e) {
      // TODO
      res = e.toString();
    }

    return res;
  }

  Future<String> notifyPurchase(PurchaseModel purchase) async {
    String res = "some error has occured";
    //send payment informattion through emali
    try {
      String date = await DateMethod().getCurrentDateAndTime();
      purchase.pendingPayment = [
        'true',
        date,
      ];
      FirebasePurchaseMethods().update(
          purchase.identification, 'pendingPayment', purchase.pendingPayment);
      res = "Success";
    } catch (e) {
      // TODO
      res = e.toString();
    }
    return res;
  }

  Future<String> finshPurchasePayment(PurchaseModel purchase,
      String transaction, bool acceptOrDecline, String reason) async {
    //receipt photo
    String res = "some error has occured";
    try {
      print("insideddd");
      String date = await DateMethod().getCurrentDateAndTime();
      purchase.acceptedPayment = [
        'true',
        date,
      ];
      purchase.acceptedPayment = ['false', date, reason];
      res = "Success";
    } catch (e) {
      // TODO
      res = e.toString();
    }
    FirebasePurchaseMethods().update(
        purchase.identification, 'requestAccepted', purchase.acceptedPayment);
//generatePurchasePdf
    return res;
  }

  Future<String> finshPurchaseTranaction(
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
      // TODO
      res = e.toString();
    }

// sendComplitedPurchaseDocument
// manuplate share holding
    return res;
  }

  Future<String> generatePurchasePdf() async {
    String res = "some error has occured";
// generate pdf
    return res;
  }

  Future<String> sendComplitedPurchaseDocument() async {
    String res = "some error has occured";
    //send pdf file to user
    //send email of the pdf

    return res;
  }
}
