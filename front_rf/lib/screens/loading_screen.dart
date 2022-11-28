import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:front_rf/screens/result_screen.dart';
import 'package:front_rf/services/fungetter.dart';
import 'package:front_rf/services/networking.dart';

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
    try {
      FunGetter funGetter = FunGetter();
      var games = await funGetter.getGames();
      print(games);

      int gameLength = games.length;
      print(gameLength);
      int randomGameIndex = Random().nextInt(gameLength);
      print(randomGameIndex);
      print(games[randomGameIndex]);

      int gameId = games[randomGameIndex]["id"];
      int gameImageId = games[randomGameIndex]["images_id"];
      print(gameId);

      var gameImage = await funGetter.getGameImage(gameImageId);

      List<dynamic> sentences = await funGetter.getSentences();
      print(sentences);
      int sentencesLength = sentences.length;
      int randomSentenceIndex = Random().nextInt(sentencesLength);

      var oneSentence = sentences[randomSentenceIndex];
      print(oneSentence);
      int photoId = await funGetter.getPhotosLength();
      print(photoId is int);
      print(oneSentence["sentence"]);
      print(games[0]["goals"]);
      print(games[0]["materiel"]);
      var photo = await funGetter.getPhoto(photoId);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => ResultScreen(
                game: games[0],
                gameImage: gameImage,
                photo: photo,
                sentence: oneSentence,
              )),
        ),
      );
    } catch (e) {
      print("Hello !");
      setState(() {
        conn = false;
      });
      print(conn);
      AlertDialog(
        content: Text("$e: Oops, something went wrong"),
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
