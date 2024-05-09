import 'dart:convert';

class ProductModel {
  String identification;
  String companyId;
  String title;
  String description;
  bool role;
  bool isDelete;
  bool isHide;
  String date;
  List<String> image;
  ProductModel({
    identification,
    companyId,
    title,
    description,
    role,
    isDelete,
    isHide,
    date,
    image,
  })  : identification = identification ?? '',
        companyId = companyId ?? '',
        title = title ?? '',
        description = description ?? '',
        role = role ?? false,
        isDelete = isDelete ?? false,
        isHide = isHide ?? false,
        date = date ?? '',
        image = image ?? [''];

  ProductModel copyWith({
    String? identification,
    String? companyId,
    String? title,
    String? description,
    String? role,
    bool? isDelete,
    bool? isHide,
    String? date,
    List<String>? image,
  }) {
    return ProductModel(
      identification: identification ?? this.identification,
      companyId: companyId ?? this.companyId,
      title: title ?? this.title,
      description: description ?? this.description,
      role: role ?? this.role,
      isDelete: isDelete ?? this.isDelete,
      isHide: isHide ?? this.isHide,
      date: date ?? this.date,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'companyId': companyId});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'role': role});
    result.addAll({'isDelete': isDelete});
    result.addAll({'isHide': isHide});
    result.addAll({'date': date});
    result.addAll({'image': image});

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      identification: map['identification'] ?? '',
      companyId: map['companyId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      role: map['role'] ?? '',
      isDelete: map['isDelete'] ?? false,
      isHide: map['isHide'] ?? false,
      date: map['date'] ?? '',
      image: List<String>.from(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(identification: $identification, companyId: $companyId, title: $title, description: $description, role: $role, isDelete: $isDelete, isHide: $isHide, date: $date, image: $image,)';
  }
}
