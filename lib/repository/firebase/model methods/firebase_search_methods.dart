import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssen_company/Models/search_model.dart';
import 'package:ssen_company/Repository/firebase/key%20words/collection_name.dart';
import 'package:ssen_company/Repository/firebase/model%20abstract/firebase_search_abstract.dart';

class FirebaseSearchMethods extends FirebaseSearchAbstract {
  List<List<dynamic>> search(List<List<dynamic>> data, String targetWord) {
    List<List<dynamic>> result = [];

    for (List<dynamic> sublist in data) {
      // Check if any element in the sublist contains the targetWord
      if (sublist.any((word) => word.toString().contains(targetWord))) {
        var filteredList =
            sublist.where((word) => word.toString().contains(targetWord));

        // Getting the length of the filtered list
        int occurrences = filteredList.length;
        result.add([
          sublist[sublist.length - 2],
          sublist[sublist.length - 1],
          occurrences
        ]);
      }
    }
    result.sort((a, b) => b[2].compareTo(a[2]));

    return result;
  }

  List<String> mergeLists(List<List<dynamic>> data) {
    List<String> mergedData = [];

    for (List<dynamic> innerList in data) {
      // Check if the inner list has at least two elements
      if (innerList.length >= 2) {
        // Convert each element to a string and add to the result list
        mergedData.addAll(innerList
            .sublist(0, innerList.length - 2)
            .map((element) => element.toString()));
      } else {
        // Handle the case where the inner list has fewer than two elements
        // You might want to add some default value or skip this inner list
        // depending on your requirements.
        // print("Skipping inner list: $innerList");
      }
    }

    return mergedData;
  }

  List<List<String>> createNestedList(List<String> inputList) {
    return inputList
        .map((str) => str.split(RegExp(r',|<!tS25EqtX!>')))
        .toList();
  }

  List<String> removeDuplicates(List<String> inputList) {
    // Convert the list to a set to remove duplicates
    Set<String> uniqueSet = inputList.toSet();

    // Convert the set back to a list
    List<String> result = uniqueSet.toList();

    return result;
  }

  @override
  Future<SearchModel> read() async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.search)
          .doc('search')
          .get();

      Map<String, dynamic>? searchData = snap.data();
      return SearchModel.fromMap(searchData!);
    } catch (e) {
      SearchModel search = SearchModel(searchItems: ['']);
      return search;
    }
  }
}
