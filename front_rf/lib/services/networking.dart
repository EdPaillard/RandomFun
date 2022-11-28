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
}
