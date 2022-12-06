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
    var photo = await funGetter.getRandomPhoto();
    var game = await funGetter.getRandomGame();
    var sentence = await funGetter.getRandomSentence();
    print(sentence);
    if (game["images_id"] != null) {
      int gameImageId = game["images_id"];
      var gameImage = await funGetter.getGameImage(gameImageId);
      picPush(game, gameImage, photo, sentence);
    } else {
      noPicPush(game, photo, sentence);
    }
  }

  void noPicPush(var game, var photo, var sentence) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => ResultScreen(
              game: game,
              photo: photo,
              sentence: sentence,
            )),
      ),
    );
  }

  void picPush(var game, var gameImage, var photo, var sentence) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => ResultScreen(
              game: game,
              gameImage: gameImage,
              photo: photo,
              sentence: sentence,
            )),
      ),
    );
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
