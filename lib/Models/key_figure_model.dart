import 'dart:convert';

class KeyFigureModel {
  String identification;
  final String name;
  final String position;
  String companyId;
  String dateAdded;
  List<String> image;
  bool isDeleted;
  bool isHidden;
  KeyFigureModel({
    required this.name,
    required this.position,
    identification,
    companyId,
    dateAdded,
    image,
    isDeleted,
    isHidden,
  })  : identification = identification ?? '',
        image = image ?? [''],
        companyId = companyId ?? "",
        dateAdded = dateAdded ?? "",
        isDeleted = isDeleted ?? false,
        isHidden = isHidden ?? false;

  KeyFigureModel copyWith({
    String? identification,
    String? name,
    String? position,
    String? companyId,
    String? dateAdded,
    List<String>? image,
    bool? isDeleted,
    bool? isHidden,
  }) {
    return KeyFigureModel(
      identification: identification ?? this.identification,
      name: name ?? this.name,
      position: position ?? this.position,
      companyId: companyId ?? this.companyId,
      dateAdded: dateAdded ?? this.dateAdded,
      image: image ?? this.image,
      isDeleted: isDeleted ?? this.isDeleted,
      isHidden: isHidden ?? this.isHidden,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'name': name});
    result.addAll({'position': position});
    result.addAll({'companyId': companyId});
    result.addAll({'dateAdded': dateAdded});
    result.addAll({'image': image});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'isHidden': isHidden});

    return result;
  }

  factory KeyFigureModel.fromMap(Map<String, dynamic> map) {
    return KeyFigureModel(
      identification: map['identification'] ?? '',
      name: map['name'] ?? '',
      position: map['position'] ?? '',
      companyId: map['companyId'] ?? '',
      dateAdded: map['dateAdded'] ?? '',
      image: List<String>.from(map['image']),
      isDeleted: map['isDeleted'] ?? false,
      isHidden: map['isHidden'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory KeyFigureModel.fromJson(String source) =>
      KeyFigureModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'KeyFigureModel(identification:$identification,  name: $name, position: $position, image: $image, companyId: $companyId, dateAdded: $dateAdded, isDeleted: $isDeleted,isHidden: $isHidden)';
}

// void main(List<String> args) {
//   KeyFigureModel x = KeyFigureModel(name: '', position: "");
//   print(x.toMap());
// }
