import 'dart:convert';

class ProductModel {
  String identification;
  String companyId;
  String title;
  String description;
  String dateAdded;
  bool isProduct;
  bool isDeleted;
  bool isHidden;
  List<String> image;
  ProductModel({
    identification,
    companyId,
    title,
    description,
    dateAdded,
    isProduct,
    isDeleted,
    isHidden,
    image,
  })  : identification = identification ?? '',
        companyId = companyId ?? '',
        title = title ?? '',
        description = description ?? '',
        dateAdded = dateAdded ?? '',
        isProduct = isProduct ?? true,
        isDeleted = isDeleted ?? false,
        isHidden = isHidden ?? false,
        image = image ?? [''];

  ProductModel copyWith({
    String? identification,
    String? companyId,
    String? title,
    String? description,
    String? dateAdded,
    bool? isProduct,
    bool? isDeleted,
    bool? isHidden,
    List<String>? image,
  }) {
    return ProductModel(
      identification: identification ?? this.identification,
      companyId: companyId ?? this.companyId,
      title: title ?? this.title,
      description: description ?? this.description,
      dateAdded: dateAdded ?? this.dateAdded,
      isProduct: isProduct ?? this.isProduct,
      isDeleted: isDeleted ?? this.isDeleted,
      isHidden: isHidden ?? this.isHidden,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'companyId': companyId});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'dateAdded': dateAdded});
    result.addAll({'isProduct': isProduct});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'isHidden': isHidden});
    result.addAll({'image': image});

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      identification: map['identification'] ?? '',
      companyId: map['companyId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      dateAdded: map['dateAdded'] ?? '',
      isProduct: map['isProduct'] ?? true,
      isDeleted: map['isDeleted'] ?? false,
      isHidden: map['isHidden'] ?? false,
      image: List<String>.from(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(identification: $identification, companyId: $companyId, title: $title, description: $description, dateAdded: $dateAdded, isProduct: $isProduct, isDeleted: $isDeleted, isHidden: $isHidden, image: $image)';
  }
}

// void main(List<String> args) {
//   ProductModel x = ProductModel();
//   print(x.toMap());
// }
