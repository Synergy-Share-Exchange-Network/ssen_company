import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TermConditionModel {
  String identification;
  String title;
  String description;
  String companyId;
  TermConditionModel({
    identification,
    title,
    description,
    companyId,
  })  : identification = identification ?? '',
        title = title ?? '',
        description = description ?? '',
        companyId = companyId ?? '';

  TermConditionModel copyWith({
    String? identification,
    String? title,
    String? description,
    String? companyId,
  }) {
    return TermConditionModel(
      identification: identification ?? this.identification,
      title: title ?? this.title,
      description: description ?? this.description,
      companyId: companyId ?? this.companyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identification': identification,
      'title': title,
      'description': description,
      'companyId': companyId,
    };
  }

  factory TermConditionModel.fromMap(Map<String, dynamic> map) {
    return TermConditionModel(
      identification: map['identification'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      companyId: map['companyId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TermConditionModel.fromJson(String source) =>
      TermConditionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TermConditionModel(identification:$identification,  title: $title, description: $description, companyId: $companyId)';
}
