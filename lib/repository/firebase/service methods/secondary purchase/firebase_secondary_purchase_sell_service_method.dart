import 'package:ssen_company/Models/purchase_model.dart';
import 'package:ssen_company/Models/secondry_post_share.dart';
import 'package:ssen_company/Repository/firebase/model%20methods/firebase_secondry_post_share_methods.dart';
import 'package:ssen_company/utils/date_method.dart';

import '../../../../Models/company_profile_model.dart';
import '../../../../Models/company_requirement_on_secondry_market_model.dart';
import '../../../../Models/user_model.dart';

class FirebaseSecondaryPurchaseSellServiceMethod {
  Future<String> createSecondaryMarketSell(
      PurchaseModel purchase,
      SecondryPostShareModel secondaryPost,
      UserModel user,
      CompanyRequirementOnSecondryMarketModel companyRequirement,
      CompanyProfileModel company) async {
    String date = await DateMethod().getCurrentDateAndTime();

    String res = "some error has occured";
    // secondaryPost.date = date;
    // secondaryPost.identification = Uuid().v1();
    // secondaryPost.companyID = company.identification;
    secondaryPost.purchaseID = purchase.identification;
    secondaryPost.shareID = purchase.shareID;
    // secondaryPost.sellerID = user.identification;

    res = await verifySecondaryMarketSell(
        purchase, secondaryPost, user, companyRequirement);

    //save purchase information to the database
    if (res == "Success") {
      secondaryPost.doesItPassTheCriteria = ['true'];
      String result =
          await postSecondaryMarketSell(secondaryPost, user, company);
      if (result == "Success") {
        res = "Success";
      } else {
        res = result;
      }
    } else {
      secondaryPost.doesItPassTheCriteria = ['false', res];

      String result =
          await postSecondaryMarketSell(secondaryPost, user, company);
      // if (result == "Success") {
      //   // res = "Success";
      // } else {
      //   // res = result;
      // }
    }

    return res;
  }

  Future<String> verifySecondaryMarketSell(
      PurchaseModel purchase,
      SecondryPostShareModel secondaryPost,
      UserModel user,
      CompanyRequirementOnSecondryMarketModel companyRequirement) async {
    String res = "some error has occured";
    try {
      bool assetExist = purchase.numberOfShare >= secondaryPost.numberOfShare;

      bool minimumShareSatisfy = secondaryPost.numberOfShare >=
          companyRequirement.minimumNumberOfShareToSell;
      bool maximumShareSatisfy = secondaryPost.numberOfShare <=
          companyRequirement.maximumNumberOfShareToSell;
      bool minimumSharePriceSatisfy = secondaryPost.pricePerShare >=
          companyRequirement.minimumPricePerShare;
      bool maximumSharePriceSatisfy = secondaryPost.pricePerShare <=
          companyRequirement.maximumPricePerShare;
      bool isUserAllowedToSell = !companyRequirement.restrictedUsersToSell
          .contains(user.identification);

      bool isShareOpenToSell = companyRequirement.isOpenToSell;

      if (!assetExist) {
        return "Asset does not exist.";
      } else if (!minimumShareSatisfy) {
        return "Number of shares is below the minimum requirement.";
      } else if (!maximumShareSatisfy) {
        return "Number of shares exceeds the maximum limit.";
      } else if (!minimumSharePriceSatisfy) {
        return "Price per share is below the minimum requirement.";
      } else if (!maximumSharePriceSatisfy) {
        return "Price per share exceeds the maximum limit.";
      } else if (!isUserAllowedToSell) {
        return "User is not allowed to sell.";
      } else if (!isShareOpenToSell) {
        return "The share is not open to sell.";
      } else {
        return "Success";
      }
    } catch (e) {
      res = e.toString();
    }
    //save purchase information to the database

    return res;
  }

  Future<String> postSecondaryMarketSell(
      SecondryPostShareModel secondryPostShare,
      UserModel user,
      CompanyProfileModel company) async {
    String res = "some error has occured";
    try {
      //save purchase information to the database
      String result = await FirebaseSecondryPostShareMethods()
          .create(secondryPostShare, user, company);

      // make the Share public
      if (result == "Success") {
        res = "Success";
      } else {
        res = result;
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
