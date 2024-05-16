import 'dart:convert';

class KeyFigureModel {
  String identification;
  final String name;
  final String position;
  String companyId;
  List<String> image;
  KeyFigureModel({
    required this.name,
    required this.position,
    identification,
    companyId,
    image,
  })  : identification = identification ?? '',
        image = image ?? [''],
        companyId = companyId ?? "";

  KeyFigureModel copyWith({
    String? identification,
    String? name,
    String? position,
    String? companyId,
    List<String>? image,
  }) {
    return KeyFigureModel(
      identification: identification ?? this.identification,
      name: name ?? this.name,
      position: position ?? this.position,
      companyId: companyId ?? this.companyId,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'name': name});
    result.addAll({'position': position});
    result.addAll({'companyId': companyId});
    result.addAll({'image': image});

    return result;
  }

  factory KeyFigureModel.fromMap(Map<String, dynamic> map) {
    return KeyFigureModel(
      identification: map['identification'] ?? '',
      name: map['name'] ?? '',
      position: map['position'] ?? '',
      companyId: map['companyId'] ?? '',
      image: List<String>.from(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory KeyFigureModel.fromJson(String source) =>
      KeyFigureModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'KeyFigureModel(identification:$identification,  name: $name, position: $position, image: $image, companyId: $companyId)';
}
