import 'dart:convert';

class SearchModel {
  final List<String> searchItems;
  SearchModel({
    required this.searchItems,
  });

  SearchModel copyWith({
    List<String>? searchItems,
  }) {
    return SearchModel(
      searchItems: searchItems ?? this.searchItems,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'searchItems': searchItems,
    };
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      searchItems: List<String>.from(map['searchItems']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SearchModel(searchItems: $searchItems)';
  List<Object?> get props => [searchItems];
}

// void main() {
//   List<String> elements = [
//     "blue car, vehicle, car, four-wheeler<ID><product>DJFSFJ557FFAS55",
//     "green scooter, transportation, scooter, two-wheel<ID><product>DJFSFJ557FFAS55",
//     "yellow bus, conveyance, bus, mass transit<ID><product>DJFSFJ557FFAS55",
//     "silver motorbike, auto, motorbike, motorcycle<ID><shop>DJFSFJ557FFAS55",
//     "orange skateboard, machine, skateboard, deck<ID><shop>DJFSFJ557FFAS55"
//   ];
//   SearchModel a = SearchModel(searchItems: elements);
//   List<String> elementsFromSearchModel = a.searchItems;
//   print(elementsFromSearchModel);
//   print(">>>>>>>>>>>>>>><<<<<<<<<<<<<<");

//   for (var element in elementsFromSearchModel) {
//     List<String> words = element.split(
//       RegExp(r"<ID>|<product>|<shop>"),
//     );
//     print(words);
//     print("=====================");
//   }
// }
