import 'package:flutter/foundation.dart';
import 'package:front_rf/services/networking.dart';

const backendUrl = 'http://162.19.66.30:7777/api';
const foodAPIUrl = 'https://api.edamam.com/api/recipes/v2';
const appId = '0d09fca5';
const appKey = '1c832a7723a2c5ca1fba36f8418d208b';

class FunGetter {
  Future<dynamic> getRecipe(List<String> ingredients) async {
    String ingredientsUrl = ingredients.join(',');
    Uri url = Uri.parse(
        '$foodAPIUrl?type=public&q=$ingredientsUrl&app_id=$appId&app_key=$appKey');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    return data;
  }

  Future<dynamic> getRecipeByID(String id) async {
    Uri url =
        Uri.parse('$foodAPIUrl/$id?type=public&app_id=$appId&app_key=$appKey');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    return data;
  }

  Future<List<dynamic>> getGames() async {
    Uri url = Uri.parse('$backendUrl/games');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    return data;
  }

  Future<dynamic> getRandomGame() async {
    Uri url = Uri.parse('$backendUrl/random/games');
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
    return data["data"];
  }

  Future<dynamic> getRandomSentence() async {
    Uri url = Uri.parse('$backendUrl/random/sentences');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    return data;
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

  Future<dynamic> getRandomPhoto() async {
    Uri url = Uri.parse('$backendUrl/random/photos');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getPhoto();
    return data;
  }

  Future<Map<String, bool>> postCalendar(
      String gameName, Uint8List photo) async {
    try {
      Uri url = Uri.parse('$backendUrl/calendar');
      NetworkHelper networkHelper = NetworkHelper(url);
      var data = await networkHelper.postData(gameName, photo);
      return data;
    } catch (e) {
      Map<String, bool> error = {"Error": true};
      return error;
    }
  }

  Future<dynamic> addRecipeToFavorite(String id) async {
    try {
      Uri url = Uri.parse('$backendUrl/recipe');
      NetworkHelper networkHelper = NetworkHelper(url);
      var data = await networkHelper.postRecipe(id);
      return data;
    } catch (e) {
      Map<String, bool> error = {"Error": true};
      return error;
    }
  }

  Future<List<dynamic>> getFavRecipes() async {
    Uri url = Uri.parse('$backendUrl/recipe');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    return data['data'];
  }

  Future<dynamic> getOneFavRecipe(String id) async {
    Uri url = Uri.parse('$backendUrl/recipe/$id');
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getDatas();
    return data;
  }
}
