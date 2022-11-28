import 'package:flutter/material.dart';
import 'package:front_rf/screens/calendar_screen.dart';
import 'package:front_rf/screens/loading_screen.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/random_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const CalendarScreen()),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.calendar_month,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blue[50]),
                onPressed: () {
                  print('object');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => LoadingScreen()),
                    ),
                  );
                },
                child: const Text(
                  'Générateur aléatoire d\'amour',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Spartan MB',
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
