import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../Models/company_profile_model.dart';
import '../../../Models/key_figure_model.dart';
import '../../../Models/log_model.dart';
import '../../../Models/user_model.dart';
import '../key words/collection_name.dart';
import '../model abstract/firebase_key_figure_abstract.dart';
import 'firebase_log_methods.dart';

class FirebaseKeyFigureMethods implements FirebaseKeyFigureAbstract {
  @override
  Future<String> create(CompanyProfileModel companyProfile,
      KeyFigureModel keyFigure, UserModel user) async {
    String res = "Some error has occured";
    keyFigure.companyId = companyProfile.identification;
    keyFigure.identification = const Uuid().v1();
    try {
      //creating announcement
      await FirebaseFirestore.instance
          .collection(CollectionName.keyFigure)
          .doc(keyFigure.identification)
          .set(keyFigure.toMap());
      //updating company
      List<String>? keyFigures = companyProfile.keyFigureID;
      keyFigures.insert(0, keyFigure.identification);
      keyFigures =
          keyFigures.where((keyFigures) => keyFigures.isNotEmpty).toList();
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .update({'keyFigureID': keyFigures});
      FirebaseLogMethods().create(
          user,
          keyFigure.identification,
          ModifiedEntity.product,
          LogLevel.info,
          LogAction.addition,
          "reason",
          ['']);
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<String> delete(String id, CompanyProfileModel companyProfile) async {
    String res = "";
    try {
      // Fetch the document to check current state
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection(CollectionName.keyFigure)
          .doc(id)
          .get();

      // Check if already deleted
      if (docSnapshot.data() != null && docSnapshot.get('isDeleted') == true) {
        res = "alreadyDeleted"; //
      } else {
        // Update if not already deleted
        await FirebaseFirestore.instance
            .collection(CollectionName.keyFigure)
            .doc(id)
            .update({
          'isDeleted': true,
        });
        //logging the deletion
        // FirebaseLogMethods().create(companyProfile, id, ModifiedEntity.product,
        //     LogLevel.info, LogAction.deletion, "reason", ['']);

        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  @override
  Future<KeyFigureModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.keyFigure)
          .doc(id)
          .get();

      Map<String, dynamic>? keyfigureData = snap.data();
      return KeyFigureModel.fromMap(keyfigureData!);
    } catch (e) {
      KeyFigureModel keyFigure = KeyFigureModel(
          identification: 'Error :${e.toString()}',
          name: 'name',
          position: 'position');
      return keyFigure;
    }
  }

  @override
  Future<String> update(
    CompanyProfileModel companyProfile,
  ) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
