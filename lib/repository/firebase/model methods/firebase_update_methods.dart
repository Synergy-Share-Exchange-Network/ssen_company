import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Models/announcement_model.dart';
import '../../../Models/company_profile_model.dart';
import '../../../Models/faq_model.dart';
import '../../../Models/key_figure_model.dart';
import '../../../Models/log_model.dart';
import '../../../Models/term_condition.dart';
import '../../../Models/testimonial_model.dart';
import '../../../Models/user_model.dart';
import '../../../Models/why_invest.dart';
import '../key words/collection_name.dart';
import 'firebase_announcement_methods.dart';
import 'firebase_company_profile_methods.dart';
import 'firebase_faq_methods.dart';
import 'firebase_key_figure_methods.dart';
import 'firebase_log_methods.dart';
import 'firebase_term_condition_methods.dart';
import 'firebase_testimonial_methods.dart';
import 'firebase_user_methods.dart';
import 'firebase_why_invest_methods.dart';

class FirebaseUpdateMethodUser {
  update(UserModel modifier, String id, String reason, String attribute,
      dynamic value, dynamic model) async {
    String res = "";
    dynamic entity;
    dynamic content;
    dynamic collection;
    List<String> whatChanges = [''];
    try {
      if (model == AnnouncementModel) {
        //announcement
        collection = CollectionName.announcement;
        entity = 'announcement';
        AnnouncementModel anc = await FirebaseAnnouncementMethods().read(id);
        content = anc.toMap();
      } else if (model == FaqModel) {
        //faq
        collection = CollectionName.faq;
        entity = 'organizationProfile';
        FaqModel faq = await FirebaseFaqMethod().read(id);
        content = faq.toMap();
      } else if (model == KeyFigureModel) {
        //key figure
        collection = CollectionName.keyFigure;
        entity = 'organizationProfile';
        KeyFigureModel kfm = await FirebaseKeyFigureMethods().read(id);
        content = kfm.toMap();
      }
      //else if (model == ProductModel) {//product
      //   collection = CollectionName.productAndService;
      //   entity = ModifiedEntity.product;
      //   ProductModel product = await ().read(id);
      //   content = faq.toMap();
      //   // print('object2');
      // }
      else if (model == CompanyProfileModel) {
        //organization
        collection = CollectionName.organization;
        entity = 'organization';
        CompanyProfileModel org =
            await FirebaseCompanyProfileMethods().read(id);
        content = org.toMap();
        // print('object2');
      } else if (model == TermConditionModel) {
        collection = CollectionName.termCondition;
        entity = 'organizationProfile';
        TermConditionModel terms =
            await FirebaseTermConditionMethods().read(id);
        content = terms.toMap();
        // print('object2');
      } else if (model == TestimonialModel) {
        collection = CollectionName.testimonial;
        entity = 'organizationProfile';
        TestimonialModel testimonies =
            await FirebaseTestimonialMethods().read(id);
        content = testimonies.toMap();
        // print('object2');
      } else if (model == UserModel) {
        collection = CollectionName.user;
        entity = 'userProfile';
        UserModel userprofile = await FirebaseUserMethods().read(id);
        content = userprofile.toMap();
        // print('object2');
      } else if (model == WhyInvestModel) {
        collection = CollectionName.whyInvest;
        entity = 'organizationProfile';
        WhyInvestModel whyInvest = await FirebasewhyInvestMethod().read(id);
        content = whyInvest.toMap();
        // print('object2');
      }
      // else if (model == TermConditionModel) {
      //   collection = CollectionName.faq;
      //   entity = ModifiedEntity.faq;
      //   FaqModel faq = await FirebaseFaqMethod().read(id);
      //   content = faq.toMap();
      //   // print('object2');
      // } else if (model == TermConditionModel) {
      //   collection = CollectionName.faq;
      //   entity = ModifiedEntity.faq;
      //   FaqModel faq = await FirebaseFaqMethod().read(id);
      //   content = faq.toMap();
      //   // print('object2');}
      else {
        print('object3');
      }
      // if (attribute == "isDeleted") {}
      await FirebaseFirestore.instance.collection(collection).doc(id).update({
        attribute: value,
      });
      whatChanges = [
        'model: $model',
        'previousValue:${content[attribute]}',
        'newValue:$value'
      ];

      await FirebaseLogMethods().create(
          modifier, id, entity, 'info', 'modification', reason, whatChanges);
      res = "success";
    } catch (e) {
      res = e.toString();
      // TODO
    }
    return res;
  }

//   delete(dynamic user, String id, String reason, dynamic model) async {
//     dynamic collect;
//     // dynamic user;
//     dynamic entity;
//     if (model == FaqModel) {
//       collect = CollectionName.faq;
//       entity = ModifiedEntity.faq;
//       print('object1');
//     } else if (model == TermConditionModel) {
//       collect = CollectionName.termCondition;
//       entity = ModifiedEntity.announcement;
//       print('object2');
//     } else if (model == AnnouncementModel) {
//       collect = CollectionName.announcement;
//       entity = ModifiedEntity.announcement;
//       print('Obj3');
//     } else {
//       // print('object3');
//     }
//     String res = "";
//     try {
//       await FirebaseFirestore.instance.collection(collect).doc(id).update({
//         'isDeleted': true,
//       });
//       //logging the deletion
//       FirebaseLogMethods()
//           .create(user, id, entity, LogLevel.info, LogAction.deletion, reason);
//       res = "success";
//     } catch (e) {
//       res = e.toString();
//     }
//     return res;
//   }
// }

// void main(List<String> args) {
//   FirebaseUpdateMethod()
//       .update('id', 'reason', 'attribute', 'value', TermConditionModel);
//   print("hellpo");
}
