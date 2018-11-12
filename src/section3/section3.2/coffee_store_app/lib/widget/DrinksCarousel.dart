import 'package:coffee_store_app/widget/DrinksCard.dart';
import 'package:flutter/material.dart';

class DrinksCarousel extends StatefulWidget {
  @override
  DrinksCarouselState createState() {
    return new DrinksCarouselState();
  }
}

class DrinksCarouselState extends State<DrinksCarousel>
  with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: coffeeTypes.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 4.0,
            color: Colors.black,
          ),
        ),
        child: DrinksCard(
          drinkType: mainTypes[0],
        ),
      ),
    );
  }
}
