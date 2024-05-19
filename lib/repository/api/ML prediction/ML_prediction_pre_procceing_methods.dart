class MLPredictionPreProcceingMethods {
  String extractDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate =
        "${dateTime.year}-${_twoDigits(dateTime.month)}-${_twoDigits(dateTime.day)}";
    return formattedDate;
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return "$n";
    }
    return "0$n";
  }

  List<List<int>> createSublistsInt(List<int> inputList, int sublistLength) {
    List<List<int>> result = [];
    for (int i = 0; i <= inputList.length - sublistLength; i++) {
      result.add(inputList.sublist(i, i + sublistLength));
    }
    return result;
  }

  List<List<String>> createSublistsString(
      List<String> inputList, int sublistLength, List<String> date) {
    List<List<String>> result = [];
    for (int i = 0; i <= inputList.length - sublistLength; i++) {
      List<String> modified = inputList.sublist(i, i + sublistLength);
      modified.insert(0, date[i + sublistLength - 1]);
      // print(modified);
      result.add(modified);
    }
    return result;
  }

  List<List<String>> addAttribute(
      List<List<String>> inputList, List<String> mlData) {
    List<List<String>> result = [];
    for (int i = 0; i <= inputList.length - 1; i++) {
      List<String> modified = inputList[i];

      String value = modified.last;
      modified.removeLast();
      String actualDate = modified.first;
      actualDate = extractDate(actualDate);

      String? element = mlData.firstWhere(
          (data) => data.startsWith(actualDate),
          orElse: () =>
              '2024-04-26 10:05:22.503,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0');

      List<String> attributeToBeAdded = element.split(',');
      attributeToBeAdded.removeAt(0);

      modified.addAll(attributeToBeAdded);
      modified.add(value);
      result.add(modified);
    }
    return result;
  }

  List<List<double>> dataToBeFeededToML(List<List<String>> inputList) {
    List<List<double>> result = [];
    List<List<String>> resultString = [];
    for (int i = 0; i <= inputList.length - 1; i++) {
      List<String> modifiedString = inputList[i];
      modifiedString.removeAt(0);

      resultString.add(modifiedString);
    }
    result = resultString.map((listOfString) {
      return listOfString.map((str) => double.parse(str)).toList();
    }).toList();
    return result;
  }

  List<List<double>> preProcess(List<String> selsesOnPrimary, int sublistLength,
      List<String> date, List<String> mlData) {
    List<List<String>> sublists =
        createSublistsString(selsesOnPrimary, sublistLength, date);
    List<List<String>> sublists2 = addAttribute(sublists, mlData);
    List<List<double>> sublists3 = dataToBeFeededToML(sublists2);
    return sublists3;
  }

  List<List<double>> preProcessingSecondarySeles(
      List<String> selsesOnSecondary) {
    List<List<double>> sublists = [];

    for (int i = 0; i <= selsesOnSecondary.length - 1; i++) {
      List<String> v1 = selsesOnSecondary[i].split(',');

      double numberOfSeles = 0.0;
      double amountOfSeles = 0.0;
      for (int j = 0; j <= v1.length - 1; j++) {
        List<String> v2 = v1[j].split('=>');

        numberOfSeles = numberOfSeles + double.parse(v2[0]);
        amountOfSeles = amountOfSeles + double.parse(v2[1]);
      }
      sublists.add([numberOfSeles / v1.length, amountOfSeles / v1.length]);
    }

    return sublists;
  }

  List<String> inputpreProcessingSecondarySelesNumber(
      List<List<double>> selsesOnSecondary) {
    return selsesOnSecondary.map((list) => list[0].toString()).toList();
  }

  List<String> inputpreProcessingSecondarySelesAmount(
      List<List<double>> selsesOnSecondary) {
    return selsesOnSecondary.map((list) => list[1].toString()).toList();
  }

  List<List<double>> getTraningData(List<List<double>> data) {
    List<List<double>> modified = [[]];
    for (int i = 0; i <= data.length - 1; i++) {
      List<double> modifiedData = data[i];
      modifiedData.removeLast();

      modified.add(modifiedData);
    }
    modified.removeAt(0);

    return modified;
  }

  List<double> getTargetData(List<List<double>> data) {
    List<double> modified = [];
    for (int i = 0; i <= data.length - 1; i++) {
      List<double> modifiedData = data[i];
      // modifiedData.removeLast();

      modified.add(modifiedData.last);
    }
    // modified.removeAt(0);

    return modified;
  }
}
