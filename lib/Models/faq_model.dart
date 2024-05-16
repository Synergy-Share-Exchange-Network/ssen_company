import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FaqModel {
  String identification;
  String title;
  String description;
  String companyId;
  String date;
  bool isDelete;
  bool isHide;
  FaqModel({
    identification,
    title,
    description,
    companyId,
    date,
    isDelete,
    isHide,
  })  : identification = identification ?? '',
        title = title ?? '',
        description = description ?? '',
        companyId = companyId ?? '',
        date = date ?? '',
        isDelete = isDelete ?? false,
        isHide = isHide ?? false;

  FaqModel copyWith({
    String? identification,
    String? title,
    String? description,
    String? companyId,
    String? date,
    bool? isDelete,
    bool? isHide,
  }) {
    return FaqModel(
      identification: identification ?? this.identification,
      title: title ?? this.title,
      description: description ?? this.description,
      companyId: companyId ?? this.companyId,
      date: date ?? this.date,
      isDelete: isDelete ?? this.isDelete,
      isHide: isHide ?? this.isHide,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identification': identification,
      'title': title,
      'description': description,
      'companyId': companyId,
      'date': date,
      'isDelete': isDelete,
      'isHide': isHide,
    };
  }

  factory FaqModel.fromMap(Map<String, dynamic> map) {
    return FaqModel(
      identification: map['identification'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      companyId: map['companyId'] as String,
      date: map['date'] as String,
      isDelete: map['isDelete'] as bool,
      isHide: map['isHide'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqModel.fromJson(String source) =>
      FaqModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FaqModel(identification:$identification,  title: $title, description: $description,  companyId: $companyId, date: $date, isDelete: $isDelete, isHide: $isHide)';
}
