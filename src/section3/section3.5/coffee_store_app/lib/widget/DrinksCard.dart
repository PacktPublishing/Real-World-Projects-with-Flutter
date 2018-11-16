import 'package:flutter/material.dart';
import 'package:coffee_store_app/model/DrinkType.dart';
import 'package:transparent_image/transparent_image.dart';

List<DrinkType> mainTypes = <DrinkType>[
  DrinkType('Coffee', 'assets/img/black-coffee.jpeg', 4.12),
  DrinkType('Tea', 'assets/img/black-tea.jpeg', 4.12),
  DrinkType('Juice', 'assets/img/lemon.jpeg', 4.12),
  DrinkType('Smoothie', 'assets/img/apple-smoothie.jpeg', 4.12),
];

List<DrinkType> coffeeTypes = <DrinkType>[
  DrinkType('Black Coffee', 'assets/img/black-coffee.jpeg', 4.12),
  DrinkType('Cappuccino', 'assets/img/cappuccino.jpeg', 4.12),
  DrinkType('Espresso', 'assets/img/espresso.jpeg', 4.12),
  DrinkType('Latte', 'assets/img/latte.jpeg', 4.12),
];

List<DrinkType> teaTypes = <DrinkType>[
  DrinkType('Black Tea', 'assets/img/black-tea.jpeg', 4.12),
  DrinkType('Brown Tea', 'assets/img/brown-tea.jpeg', 4.12),
  DrinkType('English Tea', 'assets/img/english-tea.jpeg', 4.12),
  DrinkType('Herbal Tea', 'assets/img/herbal-tea.jpeg', 4.12),
  DrinkType('Mint Tea', 'assets/img/mint-tea.jpeg', 4.12),
];

List<DrinkType> juiceTypes = <DrinkType>[
  DrinkType('Lemon Juice', 'assets/img/lemon.jpeg', 4.12),
  DrinkType('Lime Juice', 'assets/img/lime.jpeg', 4.12),
  DrinkType('Pink Grape Juice', 'assets/img/pink-grape.jpeg', 4.12),
  DrinkType('Plum Juice', 'assets/img/plum.jpeg', 4.12),
  DrinkType('Tomato Juice', 'assets/img/tomato.jpeg', 4.12),
];

List<DrinkType> smoothieTypes = <DrinkType>[
  DrinkType('Apple Smoothie', 'assets/img/apple-smoothie.jpeg', 4.12),
  DrinkType('Blackberry Smoothie', 'assets/img/black-smoothie.jpeg', 4.12),
  DrinkType('Kiwi Fruit Smoothie', 'assets/img/kiwi-smoothie.jpeg', 4.12),
  DrinkType('Raspberry Smoothie ', 'assets/img/rasberry-smoothie.jpeg', 4.12),
];

class DrinksCard extends StatelessWidget {

  final DrinkType drinkType;

  const DrinksCard({Key key, this.drinkType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Stack(
          children: <Widget>[
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(
                drinkType.image,
              ),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              fadeInDuration: Duration(
                milliseconds: 500,
              ),
              fadeInCurve: Curves.easeIn,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  drinkType.title,
                  key: Key('${drinkType.title}_drink_type'),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
