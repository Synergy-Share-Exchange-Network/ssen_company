import 'dart:convert';

class LogModel {
  final String identification;
  final DateTime date;
  final String modifierID;
  final String modifierRole; // Replaced UserRole enum with String
  final String modifiedID;
  final String modifiedEntity; // Replaced ModifiedEntity enum with String
  final String level; // Replaced LogLevel enum with String
  final String action; // Replaced LogAction enum with String

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
    String? modifierRole,
    String? modifiedID,
    String? modifiedEntity,
    String? level,
    String? action,
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
    result.addAll({'date': date.toIso8601String()});
    result.addAll({'modifierID': modifierID});
    result.addAll({'modifierRole': modifierRole});
    result.addAll({'modifiedID': modifiedID});
    result.addAll({'modifiedEntity': modifiedEntity});
    result.addAll({'level': level});
    result.addAll({'action': action});
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
      date: DateTime.parse(map['date'] ?? ''),
      modifierID: map['modifierID'] ?? '',
      modifierRole: map['modifierRole'] ?? '',
      modifiedID: map['modifiedID'] ?? '',
      modifiedEntity: map['modifiedEntity'] ?? '',
      level: map['level'] ?? '',
      action: map['action'] ?? '',
      reason: map['reason'],
      whatChanged: List<String>.from(map['whatChanged'] ?? []),
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

// void main(List<String> args) {
//   LogModel x = LogModel(
//       identification: 'identification',
//       date: DateTime.now(),
//       modifierID: 'modifierID',
//       modifierRole: 'admin',
//       modifiedID: 'modifiedID',
//       modifiedEntity: 'product',
//       level: 'info',
//       action: 'addition',
//       whatChanged: ['hello', 'dsp']);

//   print(x.toJson());
// }
