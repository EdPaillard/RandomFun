import 'package:flutter/foundation.dart';
import 'package:front_rf/services/networking.dart';

const backendUrl = 'http://162.19.66.30:7777/api';

class FunGetter {
  Future<List<dynamic>> getGames() async {
    Uri url = Uri.parse('$backendUrl/games');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    return data;
  }

  Future<dynamic> getRandomGame() async {
    Uri url = Uri.parse('$backendUrl/games/random/games');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    print(data);
    return data;
  }

  Future<dynamic> getGameImage(int id) async {
    Uri url = Uri.parse('$backendUrl/images/$id');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getPhoto();
    return data;
  }

  Future<List<dynamic>> getSentences() async {
    Uri url = Uri.parse('$backendUrl/sentences');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    return data["data"];
  }

  Future<dynamic> getRandomSentence() async {
    Uri url = Uri.parse('$backendUrl/sentences/random/sentences');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    print(data);
    return data;
  }

  Future<int> getPhotosLength() async {
    Uri url = Uri.parse('$backendUrl/photos/list/length');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    print(data);
    return data;
  }

  Future<dynamic> getPhoto(int id) async {
    Uri url = Uri.parse('$backendUrl/photos/$id');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getPhoto();
    return data;
  }

  Future<dynamic> getRandomPhoto() async {
    Uri url = Uri.parse('$backendUrl/photos/random/photos');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getPhoto();
    print(data);
    return data;
  }

  Future<Map<String, bool>> postCalendar(
      String gameName, Uint8List photo) async {
    print('INTO FUNGETTER $gameName');
    try {
      Uri url = Uri.parse('$backendUrl/calendar');
      NetworkHelper networkHelper = NetworkHelper(url);
      print('BackFromNWHelper');
      var data = await networkHelper.postData(gameName, photo);
      return data;
    } catch (e) {
      Map<String, bool> error = {"Error": true};
      return error;
    }
  }
}
