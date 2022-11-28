import 'package:front_rf/services/networking.dart';

const backendUrl = 'http://localhost:7777/api';

class FunGetter {
  Future<List<dynamic>> getGames() async {
    Uri url = Uri.parse('$backendUrl/games');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
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
    print(data);
    return data["data"];
  }

  Future<int> getPhotosLength() async {
    Uri url = Uri.parse('$backendUrl/photos/list/length');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    return data;
  }

  Future<dynamic> getPhoto(int id) async {
    Uri url = Uri.parse('$backendUrl/photos/$id');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getPhoto();
    return data;
  }
}
