import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WhyInvestModel {
  String identification;
  String title;
  String description;
  String companyId;
  List<String> image;
  String dateAdded;
  bool isDeleted;
  bool isHidden;
  WhyInvestModel({
    identification,
    title,
    description,
    companyId,
    image,
    dateAdded,
    isDeleted,
    isHidden,
  })  : identification = identification ?? '',
        title = title ?? '',
        description = description ?? '',
        companyId = companyId ?? '',
        image = image ?? [''],
        dateAdded = dateAdded ?? '',
        isDeleted = isDeleted ?? false,
        isHidden = isHidden ?? false;

  WhyInvestModel copyWith({
    String? identification,
    String? title,
    String? description,
    String? companyId,
    List<String>? image,
    String? dateAdded,
    bool? isDeleted,
    bool? isHidden,
  }) {
    return WhyInvestModel(
      identification: identification ?? this.identification,
      title: title ?? this.title,
      description: description ?? this.description,
      companyId: companyId ?? this.companyId,
      image: image ?? this.image,
      dateAdded: dateAdded ?? this.dateAdded,
      isDeleted: isDeleted ?? this.isDeleted,
      isHidden: isHidden ?? this.isHidden,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identification': identification,
      'title': title,
      'description': description,
      'companyId': companyId,
      'image': image,
      'dateAdded': dateAdded,
      'isDeleted': isDeleted,
      'isHidden': isHidden,
    };
  }

  factory WhyInvestModel.fromMap(Map<String, dynamic> map) {
    return WhyInvestModel(
        identification: map['identification'] as String,
        title: map['title'] as String,
        description: map['description'] as String,
        companyId: map['companyId'] as String,
        dateAdded: map['dateAdded'] as String,
        isDeleted: map['isDeleted'] ?? false,
        isHidden: map['isHidden'] ?? false,
        image: List<String>.from(map['image']));
  }

  String toJson() => json.encode(toMap());

  factory WhyInvestModel.fromJson(String source) =>
      WhyInvestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WhyInvestModel(identification:$identification,  title: $title, description: $description, companyId: $companyId, dateAdded: $dateAdded, isDeleted: $isDeleted,isHidden: $isHidden, image:$image)';
}

// void main(List<String> args) {
//   WhyInvestModel x = WhyInvestModel();
//   print(x.toJson());
// }
