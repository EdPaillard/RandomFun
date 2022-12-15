import 'package:flutter/material.dart';
import 'package:front_rf/screens/food_screen.dart';
import 'package:front_rf/utilities/constants.dart';
import 'package:front_rf/screens/loading_screen.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "❤️  DolciRecordi",
          style: TextStyle(color: drawColor),
        ),
      ),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 120, 30, 30),
                child: SizedBox(
                  width: 320,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: headerColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const LoadingScreen()),
                        ),
                      );
                    },
                    child: const Text(
                      'Générateur aléatoire d\'amour',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        color: drawColor,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
                child: SizedBox(
                  width: 320,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                      backgroundColor: headerColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const FoodScreen()),
                        ),
                      );
                    },
                    child: const Text(
                      'What\'s for diner ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        color: drawColor,
                      ),
                    ),
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
