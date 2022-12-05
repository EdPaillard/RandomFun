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
    print(photo);
    var game = await funGetter.getRandomGame();
    print(game);
    var sentence = await funGetter.getRandomSentence();
    print(sentence);
    if (game["images_id"] != null) {
      int gameImageId = game["images_id"];
      var gameImage = await funGetter.getGameImage(gameImageId);
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
    } else {
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
