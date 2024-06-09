import 'dart:convert';

import 'package:flutter/foundation.dart';

class salesToday {
  List<String> Sales;
  salesToday({
    Sales,
  }) : Sales = Sales ?? [''];
  salesToday copyWith({
    List<String>? Sales,
  }) {
    return salesToday(
      Sales: Sales ?? this.Sales,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'Sales': Sales});
    return result;
  }

  factory salesToday.fromMap(Map<String, dynamic> map) {
    return salesToday(
      Sales: List<String>.from(map['Sales']),
    );
  }
  String toJson() => json.encode(toMap());

  factory salesToday.fromJson(String source) =>
      salesToday.fromMap(json.decode(source));

  @override
  String toString() => 'salesToday(Sales: $Sales)';
}

void main(List<String> args) {
  salesToday x = salesToday(Sales: ["a,b,c"]);
  print(x.toMap());
}
