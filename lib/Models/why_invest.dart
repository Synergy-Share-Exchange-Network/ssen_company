import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WhyInvestModel {
  String identification;
  String title;
  String description;
  String companyId;
  WhyInvestModel({
    identification,
    title,
    description,
    companyId,
  })  : identification = identification ?? '',
        title = title ?? '',
        description = description ?? '',
        companyId = companyId ?? '';

  WhyInvestModel copyWith({
    String? identification,
    String? title,
    String? description,
    String? companyId,
  }) {
    return WhyInvestModel(
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

  factory WhyInvestModel.fromMap(Map<String, dynamic> map) {
    return WhyInvestModel(
      identification: map['identification'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      companyId: map['companyId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WhyInvestModel.fromJson(String source) =>
      WhyInvestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WhyInvestModel(identification:$identification,  title: $title, description: $description, companyId: $companyId)';
}

// void main(List<String> args) {
//   WhyInvestModel x = WhyInvestModel();
//   print(x.toJson());
// }
