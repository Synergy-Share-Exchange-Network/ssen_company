import 'dart:convert';

class MLPurchaseModel {
  List<String> date;
  List<String> seles;
  MLPurchaseModel({
    required this.date,
    required this.seles,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'date': date});
    result.addAll({'seles': seles});

    return result;
  }

  factory MLPurchaseModel.fromMap(Map<String, dynamic> map) {
    return MLPurchaseModel(
      date: List<String>.from(map['date']),
      seles: List<String>.from(map['seles']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MLPurchaseModel.fromJson(String source) =>
      MLPurchaseModel.fromMap(json.decode(source));

  MLPurchaseModel copyWith({
    List<String>? date,
    List<String>? seles,
  }) {
    return MLPurchaseModel(
      date: date ?? this.date,
      seles: seles ?? this.seles,
    );
  }

  @override
  String toString() => 'MLPurchaseModel(date: $date, seles: $seles)';
}
