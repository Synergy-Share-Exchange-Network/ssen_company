import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCallPrediction {
  // get http => null;

  Future<String> getPrediction(
    List<List<double>> traningData,
    List<double> targetData,
    List<double> newData,
  ) async {
    String res = "";
    String apiUrl = 'https://synergyshares.pythonanywhere.com/predict/';
    try {
      // Define the request body
      Map<String, dynamic> requestBody = {
        "features": traningData,
        "target_variable": targetData,
        "new_data": newData
        // "features": [
        //   [3, 5, 7, 9, 11],
        //   [5, 7, 9, 11, 13],
        //   [7, 9, 11, 13, 15],
        //   [9, 11, 13, 15, 17],
        //   [11, 13, 15, 17, 19]
        // ],
        // "target_variable": [13, 15, 17, 19, 17],
        // "new_data": [13, 15, 17, 19, 21]
      };

      // Encode the request body to JSON
      String jsonBody = jsonEncode(requestBody);

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody,
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the response JSON
        Map<String, dynamic> responseData = jsonDecode(response.body);
        // Access the prediction
        double prediction = responseData['prediction'];
        // Output the prediction
        // print('Prediction: $prediction');
        res = prediction.toString();
      } else {
        // Request failed
        // print('Request failed with status: ${response.statusCode}');
        res = response.statusCode.toString();
      }
    } catch (e) {
      // print(e);
      res = e.toString();
    }
    return res;
  }
}
