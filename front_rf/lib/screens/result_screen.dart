import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:front_rf/services/fungetter.dart';
import 'package:front_rf/utilities/constants.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {Key? key,
      required this.game,
      this.gameImage,
      required this.sentence,
      required this.photo})
      : super(key: key);

  final game;
  final gameImage;
  final sentence;
  final photo;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late String gameName = widget.game['name'];
  late Uint8List gamePicture = widget.gameImage;
  late List<dynamic> gameMateriel = widget.game['materiel'];
  late List<dynamic> gameGoals = widget.game['goals'];
  late String gameDescription = widget.game['description'];
  late String gameConclusion = widget.game['conclusion'];
  late Uint8List childPhoto = widget.photo;
  late String sentence = widget.sentence["sentence"];
  late String author = widget.sentence["author"];
  bool waiting = false;
  bool collapsed = true;
  late bool hasPicture;

  @override
  void initState() {
    super.initState();
    if (widget.gameImage != null) {
      hasPicture = true;
    } else {
      hasPicture = false;
    }
  }

  void postCalendar() async {
    FunGetter funGetter = FunGetter();
    var data = await funGetter.postCalendar(gameName, childPhoto);
    print('POSTDATA $data');
  }

  void reloadRandom() async {
    setState(() {
      waiting = true;
    });
    FunGetter funGetter = FunGetter();
    var games = await funGetter.getGames();

    int gameLength = games.length;
    int randomGameIndex = Random().nextInt(gameLength);

    List<dynamic> sentences = await funGetter.getSentences();
    int sentencesLength = sentences.length;
    int randomSentenceIndex = Random().nextInt(sentencesLength - 1) + 1;

    var oneSentence = sentences[randomSentenceIndex];
    int photoLength = await funGetter.getPhotosLength();
    int randomPhotoIndex = Random().nextInt(photoLength - 1) + 1;
    var photo = await funGetter.getPhoto(randomPhotoIndex);
    if (games[randomGameIndex]["images_id"] != null) {
      int gameImageId = games[randomGameIndex]["images_id"];
      var gameImage = await funGetter.getGameImage(gameImageId);
      setState(() {
        gameName = games[randomGameIndex]['name'];
        gamePicture = gameImage;
        gameMateriel = games[randomGameIndex]['materiel'];
        gameDescription = games[randomGameIndex]['description'];
        gameConclusion = games[randomGameIndex]['conclusion'];
        gameGoals = games[randomGameIndex]['goals'];
        childPhoto = photo;
        sentence = oneSentence['sentence'];
        author = oneSentence['author'];
        waiting = false;
        hasPicture = true;
      });
    } else {
      setState(() {
        gameName = games[randomGameIndex]['name'];
        gameMateriel = games[randomGameIndex]['materiel'];
        gameDescription = games[randomGameIndex]['description'];
        gameConclusion = games[randomGameIndex]['conclusion'];
        gameGoals = games[randomGameIndex]['goals'];
        childPhoto = photo;
        sentence = oneSentence['sentence'];
        author = oneSentence['author'];
        waiting = false;
        hasPicture = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.calendar_month),
        //     tooltip: 'Calendrier',
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: ((context) => const CalendarScreen()),
        //         ),
        //       );
        //     },
        //   ),
        // ],
        automaticallyImplyLeading: false,
        backgroundColor: headerColor,
        title: const Text(
          "❤️  RandomFun",
          style: TextStyle(color: drawColor),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: waiting
              ? const Center(
                  heightFactor: 2,
                  child: SpinKitDoubleBounce(
                    color: drawColor,
                    size: 100.0,
                  ),
                )
              : (Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: drawColor, width: 2),
                        ),
                        child: Image.memory(childPhoto),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        gameName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: drawColor,
                          fontSize: 35,
                          fontFamily: 'Captain',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: hasPicture ? Image.memory(gamePicture) : null,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ExpansionTile(
                      onExpansionChanged: (value) => setState(() {
                        collapsed = !collapsed;
                      }),
                      collapsedBackgroundColor: strawberry,
                      backgroundColor: cream,
                      collapsedIconColor: cream,
                      iconColor: strawberry,
                      title: collapsed
                          ? const Text(
                              "Materiel",
                              style: TextStyle(
                                color: cream,
                                fontFamily: 'Captain',
                                fontSize: 25,
                              ),
                            )
                          : const Text(
                              "Materiel",
                              style: TextStyle(
                                color: strawberry,
                                fontFamily: 'Captain',
                                fontSize: 25,
                              ),
                            ),
                      children: [
                        for (var materiel in gameMateriel)
                          ListTile(
                            hoverColor: drawColor,
                            selectedTileColor: drawColor,
                            title: Text(
                              materiel,
                              style: const TextStyle(
                                color: strawberry,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                      ],
                    ),
                    ExpansionTile(
                      onExpansionChanged: (value) => setState(() {
                        collapsed = !collapsed;
                      }),
                      collapsedBackgroundColor: minorColor,
                      backgroundColor: drawColor,
                      collapsedIconColor: cream,
                      iconColor: strawberry,
                      title: collapsed
                          ? const Text(
                              "Description",
                              style: TextStyle(
                                color: cream,
                                fontFamily: 'Captain',
                                fontSize: 25,
                              ),
                            )
                          : const Text(
                              "Description",
                              style: TextStyle(
                                color: strawberry,
                                fontFamily: 'Captain',
                                fontSize: 25,
                              ),
                            ),
                      children: [
                        ListTile(
                          hoverColor: const Color.fromARGB(120, 120, 120, 120),
                          selectedTileColor:
                              const Color.fromARGB(120, 120, 120, 120),
                          title: Text(
                            gameDescription,
                            style: const TextStyle(
                              color: strawberry,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      onExpansionChanged: (value) => setState(() {
                        collapsed = !collapsed;
                      }),
                      collapsedBackgroundColor: minorColor,
                      backgroundColor: drawColor,
                      collapsedIconColor: cream,
                      iconColor: strawberry,
                      title: collapsed
                          ? const Text(
                              "Objectifs",
                              style: TextStyle(
                                color: cream,
                                fontFamily: 'Captain',
                                fontSize: 25,
                              ),
                            )
                          : const Text(
                              "Objectifs",
                              style: TextStyle(
                                color: strawberry,
                                fontFamily: 'Captain',
                                fontSize: 25,
                              ),
                            ),
                      children: [
                        for (var goal in gameGoals)
                          ListTile(
                            hoverColor: drawColor,
                            selectedTileColor: drawColor,
                            title: Text(
                              goal,
                              style: const TextStyle(
                                  color: strawberry,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              textAlign: TextAlign.left,
                            ),
                          ),
                      ],
                    ),
                    ExpansionTile(
                      onExpansionChanged: (value) => setState(() {
                        collapsed = !collapsed;
                      }),
                      collapsedBackgroundColor: minorColor,
                      backgroundColor: drawColor,
                      collapsedIconColor: cream,
                      iconColor: strawberry,
                      title: collapsed
                          ? const Text(
                              "Conclusion",
                              style: TextStyle(
                                color: cream,
                                fontFamily: 'Captain',
                                fontSize: 25,
                              ),
                            )
                          : const Text(
                              "Conclusion",
                              style: TextStyle(
                                color: strawberry,
                                fontFamily: 'Captain',
                                fontSize: 25,
                              ),
                            ),
                      children: [
                        ListTile(
                          hoverColor: const Color.fromARGB(120, 120, 120, 120),
                          selectedTileColor:
                              const Color.fromARGB(120, 120, 120, 120),
                          title: Text(
                            gameConclusion,
                            style: const TextStyle(
                              color: strawberry,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        author,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: cream,
                          fontFamily: 'Pacifico',
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        sentence,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: cream,
                          fontFamily: 'Pacifico',
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            backgroundColor: headerColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: (() async {
                            reloadRandom();
                          }),
                          child: const Text(
                            "Plus d'aleatoire !",
                            style:
                                TextStyle(fontFamily: 'Captain', color: cream),
                          ),
                        ),
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     disabledBackgroundColor:
                        //         const Color.fromARGB(43, 255, 199, 30),
                        //     padding: const EdgeInsets.all(10),
                        //     backgroundColor:
                        //         const Color.fromARGB(255, 255, 200, 30),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(30.0),
                        //     ),
                        //   ),
                        //   onPressed: (() => postCalendar()),
                        //   child: const Text(
                        //     "Valider mon aleatoire",
                        //     style: TextStyle(
                        //       fontFamily: 'Captain',
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
        ),
      ),
    );
  }
}
