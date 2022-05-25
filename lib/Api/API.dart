import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  //void getData() {
  static Future<List<dynamic>> getdata() async {
      try {
        Uri requestPath =
            Uri.parse("https://reqres.in/api/users");

        var response = await http.get(requestPath);
        var decodedResponse = jsonDecode(response.body);

        List<dynamic> catogry = decodedResponse as List<dynamic>;
        return catogry;
      } catch (ex) {
        return [];
      }
    }
  }

