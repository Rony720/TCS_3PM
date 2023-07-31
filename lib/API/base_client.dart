import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl =
    "https://firestore.googleapis.com/v1/projects/physioplay-9e057/databases/(default)/documents/users/";

class MyBaseClient {
  var client = http.Client();
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);

    var response = await client.get(url);
    if (response.statusCode == 200) {
      //print(response.body);
      //print("*****");
      return response.body;
    } else {
      // ERROR
      print("GET ERROR");
    }
  }

  Future<dynamic> post(String source, String api, dynamic object) async {
    var url = Uri.parse(api);
    var payload = json.encode(object);

    var response = await client.post(url, body: payload);
    print(source);
    print("*****");
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      // throw exception
      print("EROR IN POST");
    }
  }
}
