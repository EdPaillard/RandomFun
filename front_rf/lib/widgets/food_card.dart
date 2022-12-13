import 'package:flutter/material.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({
    required this.image,
    required this.aliment,
    required this.fillIngredients,
    required this.removeIngredients,
    Key? key,
  }) : super(key: key);

  final String image;
  final String aliment;
  final void Function(String) fillIngredients;
  final void Function(String) removeIngredients;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool check = false;
  void checkFood() {
    if (check) {
      widget.removeIngredients(widget.aliment);
    } else {
      widget.fillIngredients(widget.aliment);
    }
    setState(() {
      check = !check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              checkFood();
            },
            child: Card(
              elevation: 5,
              child: Image.asset(
                widget.image,
                height: 100,
                width: 210,
              ),
            ),
          ),
          check
              ? const Positioned(
                  right: 5.0,
                  bottom: 0.0,
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                )
        ],
      ),
    );
  }
}
