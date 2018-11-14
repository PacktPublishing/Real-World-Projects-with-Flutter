import 'package:coffee_store_app/widget/DrinksCard.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:coffee_store_app/model/DrinkType.dart';

class DrinksListModel extends Model {

  List<DrinkType> _drinkType = coffeeTypes;

  List<DrinkType> get drinkType => _drinkType;

  void updateDrinksList(List<DrinkType> type) {
    _drinkType = type;
    notifyListeners();
  }
}