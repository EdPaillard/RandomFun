import 'package:flutter/material.dart';
import 'package:front_rf/screens/random_screen.dart';
import 'package:front_rf/services/fungetter.dart';
import 'package:front_rf/utilities/constants.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({required this.recipes, Key? key}) : super(key: key);
  final List<dynamic> recipes;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  bool switchIcon = false;
  final RegExp reg = RegExp(r'(?<=#recipe_).*');

  String capitalize(String string) {
    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  void addRecipeToFavorite(String recID) async {
    FunGetter funGetter = FunGetter();
    var data = await funGetter.addRecipeToFavorite(recID);
    print(data);
    print('Jour');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgFoodColor,
      appBar: AppBar(
        backgroundColor: headerFoodColor,
        title: const Text(
          "❤️  Dolci",
          style: TextStyle(color: foodWritingColor),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Accueil',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const RandomScreen()),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            for (var elem in widget.recipes)
              Center(
                child: Card(
                  margin: const EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          elem['recipe']['label'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Image.network(
                            elem['recipe']['image'],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Type de cuisine',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                        for (var type in elem['recipe']['cuisineType'])
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              '\u2022 ${capitalize(type)}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Ingrédients',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                        for (var ingr in elem['recipe']['ingredientLines'])
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              '\u2022 $ingr',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: GestureDetector(
                              onTap: () => setState(() {
                                String? recipeID =
                                    reg.stringMatch(elem['recipe']['uri']);
                                addRecipeToFavorite(recipeID!);
                                switchIcon = !switchIcon;
                              }),
                              child: switchIcon
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Color.fromARGB(255, 255, 0, 0),
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: Color.fromARGB(255, 80, 80, 80),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            // Card(
            //   child: ListTile(
            //     title: Text(elem['recipe']['label']),
            //     subtitle: Column(
            //       children: [
            //         for (var type in elem['recipe']['cuisineType'])
            //           ListTile(
            //             title: Text(type),
            //           ),
            //         for (var ingr in elem['recipe']['ingredientLines'])
            //           ListTile(
            //             title: Text(ingr),
            //           ),
            //       ],
            //     ),
            //     leading: Image.network(
            //       elem['recipe']['image'],
            //       width: 70,
            //       height: 100,
            //     ),
            //     trailing: Text(
            //         'Temps de préparation:${elem['recipe']['totalTime'].toString()}'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
