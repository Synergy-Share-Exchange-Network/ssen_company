import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  } else {
    print("No image is selected");
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

Future<List<Uint8List>> convertXFileListToUint8ListList(
    List<XFile> xFileList) async {
  List<Future<Uint8List>> futures =
      xFileList.map((xFile) => xFile.readAsBytes()).toList();
  List<Uint8List> uint8ListList = await Future.wait(futures);
  return uint8ListList;
}

bool validatePassword(String value) {
  if (value.length < 6) {
    return false;
  } else {
    return true;
  }
}

bool validateEmail(String email) {
  final emailPattern =
      RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  return emailPattern.hasMatch(email);
}

String getImage(String inputString) {
  List<String> parts = inputString.split('<thumbnail>');
  return parts[0];
}

String getThumbnail(String inputString) {
  List<String> parts = inputString.split('<thumbnail>');
  return parts[1];
}

void customShowLoadingIndicator(context) {
  showDialog(
    context: context,
    builder: (ctx) => Stack(
      alignment: Alignment.center,
      children: [
        // Your existing content goes here
        Container(),
        // Loading indicator
        Card(
          elevation: 5,
          child: Container(
            width: 50.0,
            height: 50.0,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

String numberToWords(int number) {
  if (number < 1 || number > 1000) {
    return "Number out of range";
  }

  final List<String> ones = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine'
  ];

  final List<String> teens = [
    'Eleven',
    'Twelve',
    'Thirteen',
    'Fourteen',
    'Fifteen',
    'Sixteen',
    'Seventeen',
    'Eighteen',
    'Nineteen'
  ];

  final List<String> tens = [
    'Ten',
    'Twenty',
    'Thirty',
    'Forty',
    'Fifty',
    'Sixty',
    'Seventy',
    'Eighty',
    'Ninety'
  ];

  String words = '';

  if (number >= 100) {
    words += ones[(number / 100).floor() - 1] + ' Hundred';
    number %= 100;
    if (number > 0) {
      words += ' and ';
    }
  }

  if (number >= 11 && number <= 19) {
    words += teens[number - 11];
  } else if (number >= 20) {
    words += tens[(number / 10).floor() - 1];
    if (number % 10 > 0) {
      words += ' ' + ones[number % 10 - 1];
    }
  } else if (number > 0) {
    words += ones[number - 1];
  }

  return words;
}

String convertToTwoDigit(int number) {
  if (number >= 0 && number < 10) {
    return '0$number';
  } else {
    return number.toString();
  }
}

bool isTimeFormat(String input) {
  // Use a regular expression to match the '00:00' time format.
  final RegExp regex = RegExp(r'^[0-2][0-9]:[0-5][0-9]$');
  return regex.hasMatch(input);
}

void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      content: Container(
        padding: EdgeInsets.all(20),
        height: 125,
        child: Column(
          children: [
            Text(message, style: TextStyle(color: Colors.red)),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text("   Okay   "),
            ),
          ],
        ),
      ),
    ),
  );
}

String roundToTwoDecimalPlaces(String input) {
  if (input == null) {
    return "0.00";
  }

  double value = double.tryParse(input) ?? 0.0;
  String roundedValue = value.toStringAsFixed(2);
  return roundedValue;
}
