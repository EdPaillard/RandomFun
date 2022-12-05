import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:front_rf/screens/result_screen.dart';
import 'package:front_rf/services/fungetter.dart';
import 'package:front_rf/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool conn = true;
  @override
  void initState() {
    super.initState();
    getRandomness();
  }

  void getRandomness() async {
    // try {
    FunGetter funGetter = FunGetter();
    int photoLength = await funGetter.getPhotosLength();
    int randomPhotoIndex = Random().nextInt(photoLength - 1) + 1;
    var photo = await funGetter.getPhoto(randomPhotoIndex);
    var games = await funGetter.getGames();

    int gameLength = games.length;
    int randomGameIndex = Random().nextInt(gameLength);

    List<dynamic> sentences = await funGetter.getSentences();
    int sentencesLength = sentences.length;
    int randomSentenceIndex = Random().nextInt(sentencesLength - 1) + 1;

    var oneSentence = sentences[randomSentenceIndex];
    if (games[randomGameIndex]["images_id"] != null) {
      int gameImageId = games[randomGameIndex]["images_id"];
      var gameImage = await funGetter.getGameImage(gameImageId);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => ResultScreen(
                game: games[randomGameIndex],
                gameImage: gameImage,
                photo: photo,
                sentence: oneSentence,
              )),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => ResultScreen(
                game: games[randomGameIndex],
                photo: photo,
                sentence: oneSentence,
              )),
        ),
      );
    }
  }

  int generateRandomIndex(List list) {
    int listLength = list.length;
    return Random().nextInt(listLength);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: conn
              ? const SpinKitDoubleBounce(
                  color: Colors.white,
                  size: 100.0,
                )
              : const AlertDialog(
                  content: Text("Oops, something went wrong"),
                ),
        ));
  }
}
