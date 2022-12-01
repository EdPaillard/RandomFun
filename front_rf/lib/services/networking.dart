import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final Uri url;

  Future getDatas() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return "Oops, something went wrong...";
    }
  }

  Future getPhoto() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return "Oops, something went wrong...";
    }
  }

  Future postData(String gameName, Uint8List photo) async {
    DateTime startTime = DateTime.now();
    DateTime endTime = DateTime.now().add(const Duration(hours: 2));
    Map<String, dynamic> body = {
      "game_name": gameName,
      "image": base64.encode(photo),
      "start_time": startTime,
      "end_time": endTime
    };
    print('NWHelper $body');
    http.Response response = await http.post(url, body: body);
    print('NWHelper ${response.body}');

    if (response.statusCode == 200) {
      Map<String, bool> result = {"Success": true};
      return result;
    } else {
      Map<String, bool> result = {"Success": false};
      return result;
    }
  }
}
