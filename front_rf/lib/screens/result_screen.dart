import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.memory(widget.photo),
            ),
            Center(
              child: Text(
                widget.sentence["author"],
                style: TextStyle(color: Colors.white),
              ),
            ),
            Center(
              child: Text(widget.sentence["sentence"],
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Text(widget.game["name"],
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  for (var materiel in widget.game["materiel"])
                    Text(
                      materiel,
                      style: TextStyle(color: Colors.white),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.game["description"],
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  for (var goal in widget.game["goals"])
                    Text(goal, style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.memory(widget.gameImage),
            ),
          ],
        ),
      ),
    );
  }
}
