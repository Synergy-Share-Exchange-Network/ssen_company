import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TermConditionModel {
  String identification;
  String title;
  String description;
  String companyId;
  String dateAdded;
  bool isDeleted;
  TermConditionModel({
    identification,
    title,
    description,
    companyId,
    dateAdded,
    isDeleted,
  })  : identification = identification ?? '',
        title = title ?? '',
        description = description ?? '',
        companyId = companyId ?? '',
        dateAdded = dateAdded ?? '',
        isDeleted = isDeleted ?? false;

  TermConditionModel copyWith({
    String? identification,
    String? title,
    String? description,
    String? companyId,
    String? dateAdded,
    bool? isDeleted,
  }) {
    return TermConditionModel(
      identification: identification ?? this.identification,
      title: title ?? this.title,
      description: description ?? this.description,
      companyId: companyId ?? this.companyId,
      dateAdded: dateAdded ?? this.dateAdded,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identification': identification,
      'title': title,
      'description': description,
      'companyId': companyId,
      'dateAdded': dateAdded,
      'isDeleted': isDeleted,
    };
  }

  factory TermConditionModel.fromMap(Map<String, dynamic> map) {
    return TermConditionModel(
      identification: map['identification'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      companyId: map['companyId'] as String,
      dateAdded: map['dateAdded'] as String,
      isDeleted: map['isDeleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TermConditionModel.fromJson(String source) =>
      TermConditionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TermConditionModel(identification:$identification,  title: $title, description: $description, companyId: $companyId, dateAdded: $dateAdded, isDeleted: $isDeleted)';
}

// void main(List<String> args) {
//   TermConditionModel M = TermConditionModel();
//   print(M.toMap());
// }
