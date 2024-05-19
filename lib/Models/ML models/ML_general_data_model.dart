import 'dart:convert';

import 'package:flutter/foundation.dart';

class MLGeneralDataModel {
  List<String> data;
  MLGeneralDataModel({
    required this.data,
  });

  MLGeneralDataModel copyWith({
    List<String>? data,
  }) {
    return MLGeneralDataModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': data});

    return result;
  }

  factory MLGeneralDataModel.fromMap(Map<String, dynamic> map) {
    return MLGeneralDataModel(
      data: List<String>.from(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MLGeneralDataModel.fromJson(String source) =>
      MLGeneralDataModel.fromMap(json.decode(source));

  @override
  String toString() => 'MLGeneralDataModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MLGeneralDataModel && listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
