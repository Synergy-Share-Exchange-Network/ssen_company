import 'dart:convert';

// import 'package:ssen_backend_test/Repository/firebase/key%20words/collection_name.dart';

enum UserRole { admin, editor, user }

enum ModifiedEntity {
  user,
  product,
  organization,
  announcement,
  organizationProfile,
  userProfile
}

enum LogLevel { info, warning, error, critical }

enum LogAction { addition, modification, deletion }

class LogModel {
  final String identification;
  final DateTime date;
  final String modifierID;
  final UserRole modifierRole;
  final String modifiedID;
  final ModifiedEntity modifiedEntity;
  final LogLevel level;
  final LogAction action;

  String? reason;
  List<String>? whatChanged;
  LogModel({
    required this.identification,
    required this.date,
    required this.modifierID,
    required this.modifierRole,
    required this.modifiedID,
    required this.modifiedEntity,
    required this.level,
    required this.action,
    reason,
    whatChanged,
  })  : reason = reason ?? '',
        whatChanged = whatChanged ?? [""];

  LogModel copyWith({
    String? identification,
    DateTime? date,
    String? modifierID,
    UserRole? modifierRole,
    String? modifiedID,
    ModifiedEntity? modifiedEntity,
    LogLevel? level,
    LogAction? action,
    String? reason,
    List<String>? whatChanged,
  }) {
    return LogModel(
      identification: identification ?? this.identification,
      date: date ?? this.date,
      modifierID: modifierID ?? this.modifierID,
      modifierRole: modifierRole ?? this.modifierRole,
      modifiedID: modifiedID ?? this.modifiedID,
      modifiedEntity: modifiedEntity ?? this.modifiedEntity,
      level: level ?? this.level,
      action: action ?? this.action,
      reason: reason ?? this.reason,
      whatChanged: whatChanged ?? this.whatChanged,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'date': date.toString()});
    result.addAll({'modifierID': modifierID});
    result.addAll({'modifierRole': modifierRole.name});
    result.addAll({'modifiedID': modifiedID});
    result.addAll({'modifiedEntity': modifiedEntity.name});
    result.addAll({'level': level.name});
    result.addAll({'action': action.name});
    if (reason != null) {
      result.addAll({'reason': reason});
    }
    if (whatChanged != null) {
      result.addAll({'whatChanged': whatChanged});
    }

    return result;
  }

  factory LogModel.fromMap(Map<String, dynamic> map) {
    return LogModel(
      identification: map['identification'] ?? '',
      date: map['date'] ?? '',
      modifierID: map['modifierID'] ?? '',
      modifierRole: map['modifierRole'] ?? '',
      modifiedID: map['modifiedID'] ?? '',
      modifiedEntity: map['modifiedEntity'] ?? '',
      level: map['level'] ?? '',
      action: map['action'] ?? '',
      reason: map['reason'],
      whatChanged: map['whatChanged'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LogModel.fromJson(String source) =>
      LogModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LogModel(identification: $identification, date: $date, modifierID: $modifierID, modifierRole: $modifierRole, modifiedID: $modifiedID, modifiedEntity: $modifiedEntity, level: $level, action: $action, reason: $reason, whatChanged: $whatChanged)';
  }
}

void main(List<String> args) {
  LogModel x = LogModel(
      identification: 'identification',
      date: DateTime.now(),
      modifierID: 'modifierID',
      modifierRole: UserRole.admin,
      modifiedID: 'modifiedID',
      modifiedEntity: ModifiedEntity.product,
      level: LogLevel.info,
      action: LogAction.addition,
      whatChanged: ['hello', 'dsp']);

  print(x.toJson());
}
