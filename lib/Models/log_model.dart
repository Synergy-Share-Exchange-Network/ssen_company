import 'dart:convert';

class LogModel {
  final String identification;
  final String date;
  final String identificationOfModifierId;
  final String identificationOfModified;
  final String roleOfModifiedUserID;

  String? reason;
  String? whatChanged;
  LogModel({
    required this.identification,
    required this.date,
    required this.identificationOfModifierId,
    required this.identificationOfModified,
    required this.roleOfModifiedUserID,
    reason,
    whatChanged,
  })  : reason = reason ?? '',
        whatChanged = whatChanged ?? "";

  LogModel copyWith({
    String? identification,
    String? date,
    String? identificationOfModifierId,
    String? identificationOfModified,
    String? roleOfModifiedUserID,
    String? reason,
    String? whatChanged,
  }) {
    return LogModel(
      identification: identification ?? this.identification,
      date: date ?? this.date,
      identificationOfModifierId:
          identificationOfModifierId ?? this.identificationOfModifierId,
      identificationOfModified:
          identificationOfModified ?? this.identificationOfModified,
      roleOfModifiedUserID: roleOfModifiedUserID ?? this.roleOfModifiedUserID,
      reason: reason ?? this.reason,
      whatChanged: whatChanged ?? this.whatChanged,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'date': date});
    result.addAll({'identificationOfModifierId': identificationOfModifierId});
    result.addAll({'identificationOfModified': identificationOfModified});
    result.addAll({'roleOfModifiedUserID': roleOfModifiedUserID});
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
      identificationOfModifierId: map['identificationOfModifierId'] ?? '',
      identificationOfModified: map['identificationOfModified'] ?? '',
      roleOfModifiedUserID: map['roleOfModifiedUserID'] ?? '',
      reason: map['reason'],
      whatChanged: map['whatChanged'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LogModel.fromJson(String source) =>
      LogModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LogModel(identification: $identification, date: $date, identificationOfModifierId: $identificationOfModifierId, identificationOfModified: $identificationOfModified, roleOfModifiedUserID: $roleOfModifiedUserID, reason: $reason, whatChanged: $whatChanged)';
  }
}

void main(List<String> args) {
  LogModel x = LogModel(
      identification: 'identification',
      date: 'date',
      identificationOfModifierId: 'identificationOfModifierId',
      identificationOfModified: 'identificationOfModified',
      roleOfModifiedUserID: 'roleOfModifiedUserID');

  print(x.toJson());
}
