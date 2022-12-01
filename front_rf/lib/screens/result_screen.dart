import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:front_rf/screens/calendar_screen.dart';
import 'package:front_rf/services/fungetter.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {Key? key,
      required this.game,
      required this.gameImage,
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
  late String gameName;
  late Uint8List childPhoto;
  late String sentence;
  late String author;
  late Uint8List gamePicture;
  bool waiting = true;

  @override
  void initState() {
    super.initState();
    gameName = widget.game['name'];
    childPhoto = widget.photo;
    sentence = widget.sentence["sentence"];
    author = widget.sentence["author"];
    gamePicture = widget.gameImage;
  }

  void postCalendar() async {
    FunGetter funGetter = FunGetter();
    var data = await funGetter.postCalendar(gameName, childPhoto);
    print('POSTDATA $data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            tooltip: 'Calendrier',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const CalendarScreen()),
                ),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 200, 30),
        title: const Text("❤️  RandomFun"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
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
                  style: const TextStyle(
                    color: Colors.white,
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
                child: Image.memory(widget.gameImage),
              ),
              const SizedBox(
                height: 8,
              ),
              ExpansionTile(
                collapsedBackgroundColor: const Color.fromARGB(255, 85, 85, 85),
                backgroundColor: const Color.fromARGB(120, 85, 85, 85),
                collapsedIconColor: Colors.white,
                iconColor: Colors.white,
                title: const Text(
                  "Materiel",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Captain',
                    fontSize: 25,
                  ),
                ),
                children: [
                  for (var materiel in widget.game["materiel"])
                    ListTile(
                      hoverColor: const Color.fromARGB(120, 120, 120, 120),
                      selectedTileColor:
                          const Color.fromARGB(120, 120, 120, 120),
                      title: Text(
                        materiel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                ],
              ),
              ExpansionTile(
                collapsedBackgroundColor: const Color.fromARGB(255, 85, 85, 85),
                backgroundColor: const Color.fromARGB(120, 85, 85, 85),
                collapsedIconColor: Colors.white,
                iconColor: Colors.white,
                title: const Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Captain',
                    fontSize: 25,
                  ),
                ),
                children: [
                  ListTile(
                    hoverColor: const Color.fromARGB(120, 120, 120, 120),
                    selectedTileColor: const Color.fromARGB(120, 120, 120, 120),
                    title: Text(
                      widget.game["description"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                collapsedBackgroundColor: const Color.fromARGB(255, 85, 85, 85),
                backgroundColor: const Color.fromARGB(120, 85, 85, 85),
                collapsedIconColor: Colors.white,
                iconColor: Colors.white,
                title: const Text(
                  "Objectifs",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Captain',
                    fontSize: 25,
                  ),
                ),
                children: [
                  for (var goal in widget.game["goals"])
                    ListTile(
                      hoverColor: const Color.fromARGB(120, 120, 120, 120),
                      selectedTileColor:
                          const Color.fromARGB(120, 120, 120, 120),
                      title: Text(
                        goal,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                    ),
                ],
              ),
              ExpansionTile(
                collapsedBackgroundColor: const Color.fromARGB(255, 85, 85, 85),
                backgroundColor: const Color.fromARGB(120, 85, 85, 85),
                collapsedIconColor: Colors.white,
                iconColor: Colors.white,
                title: const Text(
                  "Conclusion",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Captain',
                    fontSize: 25,
                  ),
                ),
                children: [
                  ListTile(
                    hoverColor: const Color.fromARGB(120, 120, 120, 120),
                    selectedTileColor: const Color.fromARGB(120, 120, 120, 120),
                    title: Text(
                      widget.game["conclusion"],
                      style: const TextStyle(
                        color: Colors.white,
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
                  widget.sentence["author"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.sentence["sentence"],
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: const Color.fromARGB(255, 255, 200, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: (() => print("Plop")),
                    child: const Text(
                      "Plus d'aleatoire !",
                      style: TextStyle(
                        fontFamily: 'Captain',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: const Color.fromARGB(255, 255, 200, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: (() => postCalendar()),
                    child: const Text(
                      "Valider mon aleatoire",
                      style: TextStyle(
                        fontFamily: 'Captain',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
