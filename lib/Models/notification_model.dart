import 'dart:convert';

class NotificationModel {
  final String title;
  final String description;
  String identification;
  String date;
  String companyId;
  NotificationModel({
    required this.title,
    required this.description,
    identification,
    date,
    companyId,
  })  : identification = identification ?? '',
        date = date ?? '',
        companyId = companyId ?? '';

  NotificationModel copyWith({
    String? title,
    String? description,
    String? identification,
    String? date,
    String? companyId,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      description: description ?? this.description,
      identification: identification ?? this.identification,
      date: date ?? this.date,
      companyId: companyId ?? this.companyId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'identification': identification});
    result.addAll({'date': date});
    result.addAll({'companyId': companyId});

    return result;
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      identification: map['identification'] ?? '',
      date: map['date'] ?? '',
      companyId: map['companyId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NotificationModel(title: $title, description: $description, identification: $identification, date: $date, companyId: $companyId)';
  }
}

// void main(List<String> args) {
//   NotificationModel x =
//       NotificationModel(title: 'ethio telecom', description: 'description');
//   print(x.toJson());
// }
