import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Models/log_model.dart';
import '../../../Models/user_model.dart';
import '../model abstract/firebase_log_abstract.dart';

class FirebaseLogMethods implements FirebaseLogAbstract {
  @override
  Future<String> create(
      // UserRole role,
      UserModel user,
      String id,
      ModifiedEntity entity,
      LogLevel level,
      LogAction action,
      String reason,
      List<String> whatChanged) async {
    String res = "";
    try {
      // String generateLogId(String level) {
      //   // Get current date in YYYYMMDD format
      //   final dateStr = DateTime.now().toIso8601String().replaceAll("-", "");
      //   // Generate random suffix
      //   final uuid = const Uuid().v1().substring(0, 12).replaceAll("-", "");
      //   // Combine elements with level in the middle
      //   return '$dateStr[${level.toUpperCase()}]$uuid';
      // }

      // final logId = generateLogId(level.name);
      // LogModel log = LogModel(
      //     identification: const Uuid().v8(), // Generate a unique ID
      //     date: DateTime.now(),
      //     modifierID: user.identification,
      //     // modifierRole: user.role, //r
      //     modifiedID: id,
      //     modifiedEntity: entity,
      //     level: level, // Adjust level
      //     action: action,
      //     reason: reason,
      //     whatChanged: whatChanged);
      // await FirebaseFirestore.instance
      //     .collection('log') // Target the "log" collection
      //     .doc(log.identification)
      //     .set(log.toMap());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<LogModel> read(String id) {
    // TODO: implement read
    throw UnimplementedError();
  }
}
