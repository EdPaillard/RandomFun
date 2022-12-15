import 'package:flutter/material.dart';
import 'package:front_rf/screens/random_screen.dart';
import 'package:front_rf/screens/recipe_screen.dart';
import 'package:front_rf/services/fungetter.dart';
import 'package:front_rf/utilities/constants.dart';
import 'package:front_rf/widgets/food_card.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  late List<String> ingredients = [];
  late List<dynamic> favRecipesID = [];
  late List<dynamic> favRecipes = [];

  void fillIngredientsList(String ingredient) {
    setState(() {
      ingredients.add(ingredient);
    });
  }

  void removeIngredientsList(String ingredient) {
    setState(() {
      ingredients.remove(ingredient);
    });
  }

  void recipesNavigate(dynamic recps) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => RecipeScreen(recipes: recps)),
      ),
    );
  }

  Future<List<dynamic>> getRecipe() async {
    FunGetter funGetter = FunGetter();
    dynamic data = await funGetter.getRecipe(ingredients);
    List<dynamic> recettes = data['hits'];

    return recettes;
  }

  void getFavRecipesID() async {
    FunGetter funGetter = FunGetter();
    var data = await funGetter.getFavRecipes();
    setState(() {
      favRecipesID.addAll(data);
    });
    getFavRecipes();
  }

  void getFavRecipes() async {
    FunGetter funGetter = FunGetter();
    for (var elem in favRecipesID) {
      var data = await funGetter.getRecipeByID(elem['recipe_id']);

      setState(() {
        favRecipes.add(data);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getFavRecipesID();
  }

  String capitalize(String string) {
    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: bgFoodColor,
        appBar: AppBar(
          backgroundColor: headerFoodColor,
          title: const Text(
            "❤️  Dolci",
            style: TextStyle(color: foodWritingColor),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.restaurant_menu)),
              Tab(icon: Icon(Icons.favorite)),
            ],
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
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/courgettes.png',
                        aliment: 'zucchini',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/jambon.png',
                        aliment: 'ham',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/tomates.png',
                        aliment: 'tomato',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/oeufs.png',
                        aliment: 'eggs',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/riz.png',
                        aliment: 'rice',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/pates.png',
                        aliment: 'pasta',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/poivron.png',
                        aliment: 'sweet-pepper',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/oignon.png',
                        aliment: 'onion',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/asperge.png',
                        aliment: 'asparagus',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/magret.png',
                        aliment: 'duck-breast',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/steak-hache.png',
                        aliment: 'minced-beef',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/haricot-vert.png',
                        aliment: 'string-bean',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/fish.png',
                        aliment: 'fish',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/mais.png',
                        aliment: 'corn',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/poireau.png',
                        aliment: 'leek',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/potiron.png',
                        aliment: 'pumpkin',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/champignons.png',
                        aliment: 'mushroom',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/lentilles.png',
                        aliment: 'lentils',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/patates.png',
                        aliment: 'potatoe',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/carotte.png',
                        aliment: 'carrot',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/concombre.png',
                        aliment: 'cucumber',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/petits-pois.png',
                        aliment: 'garden-peas',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/aubergine.png',
                        aliment: 'eggplant',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/avocat.png',
                        aliment: 'avocado',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/radis.png',
                        aliment: 'radish',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/melon.png',
                        aliment: 'melon',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/pasteque.png',
                        aliment: 'watermelon',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/salade.png',
                        aliment: 'salad',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/betterave.png',
                        aliment: 'beet',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/noix.png',
                        aliment: 'nuts',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/brocoli.png',
                        aliment: 'broccoli',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/choufleur.png',
                        aliment: 'cauliflower',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/pomme.png',
                        aliment: 'apple',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/epinard.png',
                        aliment: 'spinach',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FoodCard(
                        image: 'images/pousses-soja.png',
                        aliment: 'soybean',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                      FoodCard(
                        image: 'images/haricots-rouges.png',
                        aliment: 'kidney-bean',
                        fillIngredients: fillIngredientsList,
                        removeIngredients: removeIngredientsList,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      backgroundColor: headerFoodColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: (() async {
                      List<dynamic> result = await getRecipe();
                      recipesNavigate(result);
                    }),
                    child: const Text(
                      "What's for diner ?",
                      style: TextStyle(
                        fontFamily: 'Captain',
                        color: foodWritingColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  for (var elem in favRecipes)
                    Center(
                      child: Card(
                        margin: const EdgeInsets.all(15),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  elem['recipe']['label'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Pacifico',
                                  ),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
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
                              for (var ingr in elem['recipe']
                                  ['ingredientLines'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Text(
                                    '\u2022 $ingr',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
