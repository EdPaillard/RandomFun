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
    var games = await funGetter.getGames();

    int gameLength = games.length;
    int randomGameIndex = Random().nextInt(gameLength);

    int gameId = games[randomGameIndex]["id"];
    int gameImageId = games[randomGameIndex]["images_id"];

    var gameImage = await funGetter.getGameImage(gameImageId);

    List<dynamic> sentences = await funGetter.getSentences();
    int sentencesLength = sentences.length;
    int randomSentenceIndex = Random().nextInt(sentencesLength);

    var oneSentence = sentences[randomSentenceIndex];
    int photoId = await funGetter.getPhotosLength();
    var photo = await funGetter.getPhoto(photoId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => ResultScreen(
              game: games[gameLength - 1],
              gameImage: gameImage,
              photo: photo,
              sentence: oneSentence,
            )),
      ),
    );
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
