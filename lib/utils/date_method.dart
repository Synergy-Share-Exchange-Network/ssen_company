import 'package:intl/intl.dart';

class DateMethod {
  Future<String> getCurrentTime() async {
    // final response =
    //     await http.get(Uri.parse('http://worldtimeapi.org/api/ip'));
    // // final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Addis_Ababa'));

    // if (response.statusCode == 200) {
    //   final jsonData = json.decode(response.body);
    //   final dateTimeString = jsonData['datetime'];
    //   final dateTime = DateTime.parse(dateTimeString);

    //   // Add three hours to the DateTime
    //   final updatedDateTime = dateTime.add(Duration(hours: 3));
    //   TimeOfDay timeOnly = TimeOfDay.fromDateTime(updatedDateTime);
    //   String timeString =
    //       "${timeOnly.hour}:${timeOnly.minute.toString().padLeft(2, '0')}";

    //   return timeString;
    // } else {
    //   throw Exception('Failed to fetch current date and time');
    // }
    final now = DateTime.now();
    final formatter = DateFormat('HH:mm');
    return formatter.format(now);
  }

  Future<String> getCurrentDate() async {
    // try {
    //   final response =
    //       await http.get(Uri.parse('http://worldtimeapi.org/api/ip'));
    //   // final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Addis_Ababa'));

    //   if (response.statusCode == 200) {
    //     final jsonData = json.decode(response.body);
    //     final dateTimeString = jsonData['datetime'];
    //     final dateTime = DateTime.parse(dateTimeString);

    //     // Add three hours to the DateTime
    //     final updatedDateTime = dateTime.add(Duration(hours: 3));
    //     String dateOnly = DateFormat('yyyy-MM-dd').format(updatedDateTime);

    //     return dateOnly;
    //   } else {
    //     throw Exception('Failed to fetch current date and time');
    //   }
    // } catch (e) {
    // return '2023-10-31';

    // }
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  Future<String> getCurrentDateAndTime() async {
    // try {
    //   final response =
    //       await http.get(Uri.parse('http://worldtimeapi.org/api/ip'));
    //   // final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Addis_Ababa'));

    //   if (response.statusCode == 200) {
    //     final jsonData = json.decode(response.body);
    //     final dateTimeString = jsonData['datetime'];
    //     final dateTime = DateTime.parse(dateTimeString);

    //     // Add three hours to the DateTime
    //     final updatedDateTime = dateTime.add(Duration(hours: 3));
    //     String dateOnly = DateFormat('yyyy-MM-dd').format(updatedDateTime);

    //     return dateOnly;
    //   } else {
    //     throw Exception('Failed to fetch current date and time');
    //   }
    // } catch (e) {
    // return '2023-10-31';

    // }
    final now = DateTime.now();

    return now.toString();
  }

  String formatDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

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
}
